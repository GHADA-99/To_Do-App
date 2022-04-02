import 'package:flutter/material.dart';
import 'package:to_do/appTheme.dart';
import 'package:intl/intl.dart';
import 'package:to_do/data/todo.dart';
import 'package:to_do/firebase_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomSheetWidget extends StatefulWidget {

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  GlobalKey<FormState>formController=GlobalKey<FormState>();

  String taskTitle='';
  String taskDescription='';
  DateTime selectedDate=DateTime.now();
  bool taskIsDone=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.add_new_task, style: Theme.of(context).textTheme.subtitle1),
          Form(
            key: formController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                  },
                  onChanged: (text){
                    taskTitle=text;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your task',
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: MyThemeData.greyColor,
                    ),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                  },
                  onChanged: (text){
                    taskDescription=text;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter task description',
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: MyThemeData.greyColor,
                    ),
                  ),
                  maxLines: 4,
                  minLines: 4,
                ),
                const SizedBox(height: 12),
                Text('Task Date', style: Theme.of(context).textTheme.subtitle2),
                const SizedBox(height: 10),
                InkWell(
                  onTap: (){
                    datePicker();
                  },
                  child: Text(DateFormat.yMMMEd().format(selectedDate),
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center),
                ),
                const SizedBox(height: 18),
                ElevatedButton(
                    onPressed: () {
                      addTask();
                    },
                    child: Container(
                        margin: const EdgeInsets.all(12),
                        child: Text(AppLocalizations.of(context)!.add_task,
                            style: Theme.of(context).textTheme.subtitle2?.copyWith(color:MyThemeData.whiteColor ),
                        ),
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void datePicker()async{
     var chosendate= await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 360)),
    );
     if(chosendate!=null){
        selectedDate=chosendate;
        setState(() {

        });
     }
  }

  void  addTask(){
    //validation before adding a task for all form content
    if(formController.currentState?.validate()==true){
      //add task
      Task task=Task(title: taskTitle, description: taskDescription, date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch);
      addTaskToFirebase(task)
          .then((value) {
        Navigator.pop(context);
      }).onError((error, stackTrace) {
        print('error');
      }).timeout(Duration(seconds: 10),onTimeout: (){print('not connected');});
    }
  }
}



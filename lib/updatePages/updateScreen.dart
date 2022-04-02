import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:to_do/appTheme.dart';

class UpdateScreen extends StatefulWidget {
  static const String routeName='Update Screen';
  DateTime selectedDate=DateTime.now();

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemeData.primaryColor,
      appBar: AppBar(
        backgroundColor: MyThemeData.blueColor,
        elevation: 0,
        title: Text(AppLocalizations.of(context)!.todo_list,style: Theme.of(context).textTheme.headline1),
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              color: MyThemeData.blueColor,
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.1,
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(top: 24,left: 18,right: 18,bottom: MediaQuery.of(context).size.height*0.1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MyThemeData.whiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:[
                       Center(child: Text('Edit Task',style: Theme.of(context).textTheme.subtitle2)),
                       Form(
                           child: Column(
                             children: [
                               TextFormField(
                                 //onChanged: (){},
                                 validator: (value) {
                                   if (value == null || value.isEmpty) {
                                     return 'Please enter some text';
                                   }
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
                               //  onChanged: (){},
                                 validator: (value) {
                                   if (value == null || value.isEmpty) {
                                     return 'Please enter some text';
                                   }
                                 },
                                 decoration: const InputDecoration(
                                   hintText: 'Enter your task',
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
                                 //  datePicker();
                                 },
                                 child: Text(DateFormat.yMMMEd().format(widget.selectedDate),
                                     style: Theme.of(context).textTheme.bodyText1,
                                     textAlign: TextAlign.center),
                               ),
                               const SizedBox(height: 18),
                               ElevatedButton(
                                   onPressed: (){},
                                   child: Container(
                                     margin: const EdgeInsets.all(12),
                                     child: Text(AppLocalizations.of(context)!.save_changes,
                                       style: Theme.of(context).textTheme.subtitle2?.copyWith(color:MyThemeData.whiteColor ),
                                     ),
                                   ),
                               ),
                             ],
                           )
                       ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void datePicker()async{
    var chosendate= await showDatePicker(
      context: context,
      initialDate: widget.selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 360)),
    );
    if(chosendate!=null){
      widget.selectedDate=chosendate;
      setState(() {

      });
    }
  }
}

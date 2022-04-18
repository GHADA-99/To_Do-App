import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do/appTheme.dart';
import 'package:to_do/data/todo.dart';
import 'package:to_do/firebase_utils.dart';
import 'package:to_do/homePages/tasksList/listItemWidget.dart';
class TasksListsTab extends StatefulWidget {
  @override
  State<TasksListsTab> createState() => _TasksListsTabState();
}

class _TasksListsTabState extends State<TasksListsTab> {
  List<Task> tasksList=[];

  DateTime selectedDate=DateTime.now();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    reloadData(tasksList);
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate:DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              if(date==null){return;}
              selectedDate = date;
              reloadData(tasksList);
              setState(() {

                       });     },
            leftMargin: 20,
            monthColor: Colors.black,
            dayColor: Colors.teal[200],
            activeDayColor: Colors.white,
            activeBackgroundDayColor: Colors.redAccent[100],
            dotsColor: const Color(0xFF333A47),
           // selectableDayPredicate: (date) => date.day != 23,
          ),
              Expanded(
                child: StreamBuilder<QuerySnapshot<Task>>(
                  stream:getTaskTFromFirebase(selectedDate),
                  //listen data so we 've 3 cases {loading,error,success}
                  builder:(BuildContext,SnapShot){
                    if(SnapShot.connectionState==ConnectionState.waiting){
                      return const Center(child: CircularProgressIndicator(color:MyThemeData.blueColor));
                    }else if(SnapShot.hasError){
                      return Text('Something is wrong');
                    }
                    //....imp....
                    //success put data in empty list by this way
                    tasksList= SnapShot.data?.docs.map((docSnap) => docSnap.data()).toList()??[];
                    return ListView.builder(itemBuilder: (BuildContext,index){
                      //every Time forget index
                      return ListItem(
                          tasksList[index]
                      );
                    },itemCount: tasksList.length,);
                  } ,
                )
              ),

          //provider

          // Expanded(
          //     child:ListView.builder(itemBuilder: (BuildContext,index){
          //       //every Time forget index
          //       return ListItem(
          //           tasksList[index]
          //       );
          //     },itemCount: tasksList.length)
          // ),

        ],
      ),
    );
  }
}
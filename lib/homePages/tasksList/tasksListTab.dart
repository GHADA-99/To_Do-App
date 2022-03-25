import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do/homePages/tasksList/listItemWidget.dart';
class TasksListsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: DateTime(2022, 3, 19),
            firstDate: DateTime(2020, 1, 15),
            lastDate: DateTime(2023, 11, 20),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            monthColor: Colors.black,
            dayColor: Colors.teal[200],
            activeDayColor: Colors.white,
            activeBackgroundDayColor: Colors.redAccent[100],
            dotsColor: const Color(0xFF333A47),
            selectableDayPredicate: (date) => date.day != 23,
          ),
              Expanded(
                child: ListView.builder(itemBuilder: (BuildContext,index){
                  return ListItem();
                },itemCount: 10,),
              ),

        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:to_do/appTheme.dart';
import 'package:to_do/data/todo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do/updatePages/updateScreen.dart';

import '../../firebase_utils.dart';

class ListItem extends StatefulWidget {
  Task task;
  ListItem(this.task);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane:  ActionPane(
        motion:const DrawerMotion(),
        children: [
          SlidableAction(
              onPressed: (BuildContext){
                     deleteTask(widget.task);
          },
            backgroundColor: Colors.red,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: InkWell(
        onTap: (){
          //Navigate with parameters to another page
          Navigator.pushNamed(context, UpdateScreen.routeName);
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          margin:const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: MyThemeData.whiteColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 4,
                color: MyThemeData.blueColor,
              ),
             const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.task.title,style: Theme.of(context).textTheme.subtitle2?.copyWith(color: MyThemeData.blueColor)),
                    Text(widget.task.description,style: Theme.of(context).textTheme.bodyText1?.copyWith(color: MyThemeData.blueColor)),
                    Row(
                      children:const [
                        Icon(Icons.watch_later_outlined),
                        SizedBox(width: 8,),
                        Text("task.date"),
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  toggleIsDone(widget.task);
                },
                child: Container(
                  padding:const EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                  decoration: BoxDecoration(
                    color: MyThemeData.blueColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                    child:const Icon(Icons.check,color: MyThemeData.whiteColor,size: 28),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget? toggleIsDone(Task tasks){
    print(tasks.isDone);
    this.widget.task.isDone != tasks.isDone;
    print(widget.task.isDone);
    if(widget.task.isDone==false){
      return Container(
        padding:const EdgeInsets.symmetric(vertical: 4,horizontal: 12),
        decoration: BoxDecoration(
          color: MyThemeData.blueColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child:const Icon(Icons.check,color: MyThemeData.whiteColor,size: 28),
      );
    }
    else {
      return Container(
        padding:const EdgeInsets.symmetric(vertical: 4,horizontal: 12),
        decoration: BoxDecoration(
          color: MyThemeData.greenColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text('Done',style: Theme.of(context).textTheme.subtitle2),
      );
    }
  }
}

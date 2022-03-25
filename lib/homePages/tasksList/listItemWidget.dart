import 'package:flutter/material.dart';
import 'package:to_do/appTheme.dart';

class ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                Text('Task name',style: Theme.of(context).textTheme.subtitle2?.copyWith(color: MyThemeData.blueColor)),
                Row(
                  children:const [
                    Icon(Icons.watch_later_outlined),
                    SizedBox(width: 8,),
                    Text('10:30 AM'),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding:const EdgeInsets.symmetric(vertical: 4,horizontal: 12),
            decoration: BoxDecoration(
              color: MyThemeData.blueColor,
              borderRadius: BorderRadius.circular(12),
            ),
              child:const Icon(Icons.check,color: MyThemeData.whiteColor,size: 28),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:to_do/appTheme.dart';

import 'dropDownMenu.dart';

class SettingsTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Language',style:Theme.of(context).textTheme.subtitle2),
          ),
          DropDownMenu('English','Arabic'),
         const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Mode',style:Theme.of(context).textTheme.subtitle2),
          ),
          DropDownMenu('Light','Dark'),
        ],
      ),
    );
  }
}




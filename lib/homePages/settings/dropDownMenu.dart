import 'package:flutter/material.dart';
import 'package:to_do/appTheme.dart';
class DropDownMenu extends StatefulWidget {
  String firstOption;
  String secondOption;
  DropDownMenu(this.firstOption,this.secondOption);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  String _dropDownValue='';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: MyThemeData.blueColor,width: 2),
        color: MyThemeData.whiteColor,
      ),
      child: DropdownButton(
        underline: Container(color: Colors.transparent),
        hint: _dropDownValue.isEmpty
            ?  Text('Drop Down',style: Theme.of(context).textTheme.bodyText1)
            : Text(
          _dropDownValue,
          style:const TextStyle(color: Colors.blue),
        ),
        isExpanded: true,
        iconSize: 30.0,
        iconEnabledColor: MyThemeData.blueColor,
        style:const TextStyle(color: Colors.blue),
        items: [widget.firstOption, widget.secondOption].map(
              (val) {
            return DropdownMenuItem<String>(
              value: val,
              child: Text(val,style: Theme.of(context).textTheme.bodyText2),
            );
          },
        ).toList(),
        onChanged: ( text) {
          _dropDownValue = text.toString();
          setState(() {});
        },
      ),
    );
  }
}
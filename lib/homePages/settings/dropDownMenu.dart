import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/appTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do/provider.dart';

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
    var provider=Provider.of<MyAppProvider>(context);
    return Container(
      padding:const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: MyThemeData.blueColor,width: 2),
        color: MyThemeData.whiteColor,
      ),
      child: DropdownButton(
        underline: Container(color: Colors.transparent),
        hint: _dropDownValue.isEmpty
            ?  Text(AppLocalizations.of(context)!.drop_down,style: Theme.of(context).textTheme.bodyText1)
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
        onChanged: (text) {
          print('text is $text');
          _dropDownValue = text.toString();
          setState(() {
            if(_dropDownValue=='Arabic'||_dropDownValue=='الانجليزية'){
             provider.getLanguage('ar');
            }else if(_dropDownValue=='English'||_dropDownValue=='العربية'){
              provider.getLanguage('en');
            }
            if(_dropDownValue=='Light'||_dropDownValue=='نهاري'){
              provider.getTheme(ThemeMode.light);
             }
            else if(_dropDownValue=='Dark'||_dropDownValue=='ليلي'){
              provider.getTheme(ThemeMode.dark);
            }
          });
        },
      ),
    );
  }

}
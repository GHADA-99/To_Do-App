import 'package:flutter/material.dart';
import 'package:to_do/appTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
            child: Text(AppLocalizations.of(context)!.language,style:Theme.of(context).textTheme.subtitle2),
          ),
          DropDownMenu(AppLocalizations.of(context)!.english,AppLocalizations.of(context)!.arabic),
         const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(AppLocalizations.of(context)!.mode,style:Theme.of(context).textTheme.subtitle2),
          ),
          DropDownMenu(AppLocalizations.of(context)!.light,AppLocalizations.of(context)!.dark),
        ],
      ),
    );
  }
}




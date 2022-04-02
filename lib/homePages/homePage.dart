import 'package:flutter/material.dart';
import 'addTaskBottomSheet.dart';
import 'settings/settingsTab.dart';
import 'tasksList/tasksListTab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../appTheme.dart';
class HomePage extends StatefulWidget {
  static const String routeName='Home Page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemeData.primaryColor,
      appBar: PreferredSize(
        preferredSize:Size.fromHeight(MediaQuery.of(context).size.height*0.1),
        child: AppBar(
          title: Text(AppLocalizations.of(context)!.todo_list,style: Theme.of(context).textTheme.headline1),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (index){
           this.index=index;
           setState(() {

           });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list),label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: ''),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet();
        },
        shape: const StadiumBorder(
          side: BorderSide(color: MyThemeData.whiteColor,width: 4),
        ),
        child:const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body:homeTabs[index],
    );
  }

  List<Widget>homeTabs=[TasksListsTab(),SettingsTab()];
  void showBottomSheet(){
    showModalBottomSheet(context: context, builder: (BuildContext){
      return BottomSheetWidget();
    });
  }
}

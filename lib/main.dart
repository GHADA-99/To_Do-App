import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do/appTheme.dart';
import 'package:to_do/homePages/homePage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do/updatePages/updateScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( ChangeNotifierProvider(
    create: (BuildContext){
      return MyAppProvider();
    },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyAppProvider>(context);
    return MaterialApp(
      title: 'Localizations Sample App',
      localizationsDelegates:  [
       AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      locale:  Locale(provider.languageCode),
      themeMode: provider.themeMode,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName:(BuildContext)=>HomePage(),
        UpdateScreen.routeName:(BuildContext)=>UpdateScreen()
      },
    );
  }
}

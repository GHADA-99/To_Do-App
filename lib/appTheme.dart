import 'package:flutter/material.dart';

class MyThemeData{
  static  const Color primaryColor=Color(0xFFDFECDB);
  static  const Color greenColor=Color(0xFF61E757);
  static  const Color whiteColor=Color(0xFFFFFFFF);
  static  const Color blueColor=Color(0xFF5D9CEC);
  static  const Color greyColor=Color(0xFFC8C9CB);
  static  const Color blackColor=Color(0xFF000000);

  static final ThemeData lightTheme=ThemeData(
    textTheme: const TextTheme(
      headline1: TextStyle(
        color:whiteColor,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      subtitle2: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      bodyText1:TextStyle(
        color: greyColor,
        fontSize: 18,
      ) ,
      bodyText2: TextStyle(
        color: blueColor,
        fontSize: 16,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      selectedItemColor:blueColor,
      unselectedItemColor: greyColor,
    ),
    elevatedButtonTheme:   ElevatedButtonThemeData(
     style: ElevatedButton.styleFrom(
         primary: blueColor,
     ),
    ),
    bottomSheetTheme:  BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      )
    )
  );
  static final ThemeData darkTheme=ThemeData(
      textTheme: const TextTheme(
        headline1: TextStyle(
          color:whiteColor,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
        subtitle1: TextStyle(
          color:whiteColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        subtitle2: TextStyle(
          color:whiteColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        bodyText1:TextStyle(
          color: greyColor,
          fontSize: 18,
        ) ,
        bodyText2: TextStyle(
          color: blueColor,
          fontSize: 16,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: Colors.transparent,
        selectedItemColor:blueColor,
        unselectedItemColor: greyColor,
      ),
      elevatedButtonTheme:   ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: blueColor,
        ),
      ),
      bottomSheetTheme:  BottomSheetThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          )
      )
  );
}
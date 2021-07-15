
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rtl_flutter/localization/languages.dart';
import 'package:rtl_flutter/localization/localization_constants.dart';

import '../../main.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  @override
  final Size preferredSize =Size.fromHeight( 100); // default is 56.0

  CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  void _changeLanguage(BuildContext context,Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50),
          ),
          // border: Border.all(
          //   // width: 3,
          //   color: Colors.white,
          //   style: BorderStyle.solid,
          // ),
          gradient: LinearGradient(
              colors: [Colors.red, Colors.blue],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.5, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Center(
            child: Text( getTranslated(context, 'title')??
              title,
              style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),
            )),
      ),
      backgroundColor: Colors.white,
      toolbarHeight: MediaQuery.of(context).size.height / 4,
      // title:
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.vertical(
          bottom: new Radius.elliptical(50, 50),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 20,left: 20,bottom: 10),
          child: DropdownButton<Language>(
            underline: SizedBox(),
            icon: Center(
              child: Icon(
                Icons.language,size: 30,
                color: Colors.white,
              ),
            ),
            onChanged: (Language? language) async {
              _changeLanguage(context,language!);
            },
            items: Language.languageList()
                .map<DropdownMenuItem<Language>>(
                  (e) => DropdownMenuItem<Language>(
                value: e,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      e.flag,
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(e.name)
                  ],
                ),
              ),
            )
                .toList(),
          ),
        ),
      ],
    );
  }
}
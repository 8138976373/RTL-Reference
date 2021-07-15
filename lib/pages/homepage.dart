import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rtl_flutter/Localization/languages.dart';
import 'package:rtl_flutter/Localization/localization_constants.dart';
import 'package:rtl_flutter/main.dart';
import 'package:rtl_flutter/widget/custombutton.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
      // automaticallyImplyLeading: false,
      //       title:
      //           Text('RTL Demonstration APP'),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
                child: DropdownButton<Language>(
                  underline: SizedBox(),
                  icon: Center(
                    child: Icon(
                      Icons.language,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  onChanged: (Language? language) async {
                    _changeLanguage(context, language!);
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
            // floating: true,
            flexibleSpace:
            Padding(
              padding: const EdgeInsets.all(40.0,),
              child: Text(
                  getTranslated(context, 'title') ?? 'RTL Demonstration APP',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,),),
            ),
            expandedHeight: 200,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                  title: Text('Item #$index'),
                  onTap: () {
                    _showMyDialog(context);
                  }),
              childCount: 15,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
              child: Text(
            getTranslated(context, 'flutter_state_management') ??
                'Flutter State Management',
            style: TextStyle(fontSize: 18),
          )),
          content: SingleChildScrollView(
            child: Center(
              child: ListBody(
                children: <Widget>[
                  CustomButton(
                    child: Text(
                      getTranslated(context, 'update') ?? 'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                  CustomButton(
                    child: Text(
                        getTranslated(
                              context,
                              'delete',
                            ) ??
                            'Delete',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {},
                  ),

                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(getTranslated(context, 'cancel') ?? 'Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _changeLanguage(BuildContext context, Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }
}

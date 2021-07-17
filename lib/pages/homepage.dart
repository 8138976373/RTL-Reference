import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rtl_flutter/Localization/languages.dart';
import 'package:rtl_flutter/Localization/localization_constants.dart';
import 'package:rtl_flutter/main.dart';
import 'package:rtl_flutter/widget/custombutton.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  // Alignment _dragAlignment = Alignment.center;

  setAnimation(BuildContext context){
    late final AnimationController _controller =
    AnimationController(vsync: this, duration: Duration(seconds: 3))
      ..repeat();
    late final Animation<Offset> _animation =
    Tween<Offset>(begin: Offset.zero, end: Offset(
        double.parse(getTranslated(context,'dx_value') ?? '5')  ,
        double.parse(getTranslated(context,'dy_value')??'.7')))
        .animate(_controller);
    return _animation;
  }

  setAnimationReverse(BuildContext context){
    late final AnimationController _controller =
    AnimationController(vsync: this, duration: Duration(seconds: 3))
      ..repeat();
    late final Animation<Offset> _animation =
    Tween<Offset>(begin: Offset.zero, end: Offset(
        double.parse(getTranslated(context,'dx_value_reverse') ?? '5')  ,
        double.parse(getTranslated(context,'dy_value_reverse')??'.7')))
        .animate(_controller);
    return _animation;
  }



  @override
  void dispose() {
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          slivers: <Widget>[

            SliverAppBar(
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10,top: 20),
                  child: DropdownButton<Language>(
                    underline: SizedBox(),
                    icon:  Row(
                      children: [
                        SizedBox(height: 100,),
                        Icon(
                            Icons.language,
                            size: 30,
                            color: Colors.white,
                          ),
                      ],
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
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(
                  40.0,
                ),
                child: Column(
                  children: [
                    Center(
                      child: SlideTransition(
                        position: setAnimationReverse(context),
                        child: Icon(
                          Icons.bubble_chart,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),),

                    Row(
                      children: [
                         SlideTransition(
                            position: setAnimationReverse(context),
                            child: Icon(
                              Icons.bubble_chart,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        Spacer(flex: 1,),
                        Center(
                          child: SlideTransition(
                            position: setAnimation(context),
                            child: Icon(
                              Icons.bubble_chart,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),),
                      ],
                    ),

                    Row(
                      children: [
                        Text(
                          getTranslated(context, 'title') ?? 'RTL Demonstration APP',
                          style: GoogleFonts.sofia(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white)
                          // style: TextStyle(
                          //   fontSize: 20,
                          //   fontWeight: FontWeight.bold,
                          //   color: Colors.white,
                          // ),
                        ),
                        Spacer(flex: 1,),
                        CustomButton(
                          onPressed: () {},
                          child: Text(
                            'Click here',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.red,
                          paddingRight: 50,
                          paddingLeft: 50,
                        )
                      ],
                    ),
                  ],
                ),
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
                  CustomButton(paddingBottom: 10,
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

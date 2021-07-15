import 'package:flutter/material.dart';
import 'package:rtl_flutter/pages/homepage.dart';

import 'routconstant.dart';

class Routes {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {

      case initialRoute:
        return MaterialPageRoute(builder: (_) => HomePage());

      // case homeGetXRoute:
      //   final arg = settings.arguments as ScreenArguments;
      //   return MaterialPageRoute(
      //       builder: (_) => ViewDetails(
      //           title: arg.title, scrollDirection: arg.scrollDirection));
      //
      // case addDetailsGetXRout:
      //   return MaterialPageRoute(builder: (_) => AddData());
      //
      // case updateDetailsGetXRoute:
      //   final int index = settings.arguments as int;
      //   return MaterialPageRoute(builder: (_) => UpdateData(index: index));

      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}

class ScreenArguments {
  String title = 'GetX App';
  Axis scrollDirection = Axis.vertical;
  ScreenArguments(this.title, this.scrollDirection);
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_archit/utils/routes/route_name.dart';
import 'package:flutter_mvvm_archit/view/home_screen.dart';
import 'package:flutter_mvvm_archit/view/login_screen.dart';
import 'package:flutter_mvvm_archit/view/sanction_screen.dart';

import '../../view/SanctionScreenSecond.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final argume=settings.arguments;

    switch (settings.name) {

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());


      case RoutesName.sanction:
        return MaterialPageRoute(
          //  builder: (BuildContext context) => SanctionScreen());

            builder: (BuildContext context) => SanctionScreenSecond());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(child: Text("jgjhghjg")),
          );
        });
    }
  }
}

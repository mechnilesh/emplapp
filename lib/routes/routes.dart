import 'package:employee/features/auth/screen/login_screen.dart';
import 'package:employee/features/dashboard/screens/dashboad.dart';
import 'package:employee/routes/route_names.dart';
import 'package:flutter/material.dart';

class Routes {
  static MaterialPageRoute materialPageRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RouteNames.dashboard:
        return MaterialPageRoute(builder: (context) => const DashboardScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('no route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

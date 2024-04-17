import 'package:flutter/material.dart';
import 'package:mvvm_strructure/utils/routes/route_names.dart';
import 'package:mvvm_strructure/view/home_screen.dart';
import 'package:mvvm_strructure/view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RouteName.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text('No Route Found!'),
              ),
            );
          },
        );
    }
  }
}

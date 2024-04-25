import 'package:flutter/material.dart';
import 'package:mvvm_strructure/utils/routes/route_names.dart';
import 'package:mvvm_strructure/view/home_view.dart';
import 'package:mvvm_strructure/view/login_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homeView:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      case RouteName.loginView:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
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

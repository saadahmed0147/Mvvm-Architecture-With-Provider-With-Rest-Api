import 'package:flutter/material.dart';
import 'package:mvvm_strructure/utils/routes/route.dart';
import 'package:mvvm_strructure/utils/routes/route_names.dart';
import 'package:mvvm_strructure/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'dart:io';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteName.loginView,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

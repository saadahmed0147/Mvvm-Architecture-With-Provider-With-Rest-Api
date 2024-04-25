import 'package:flutter/material.dart';
import 'package:mvvm_strructure/utils/routes/utils.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () {
              Utils.flushBarErrorMessage('No Internet Connection', context);
            },
            child: Text('home')),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_strructure/repository/auth_repository.dart';
import 'package:mvvm_strructure/utils/routes/route_names.dart';
import 'package:mvvm_strructure/utils/routes/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);

      if (kDebugMode) {
        print(value.toString());
        Utils.flushBarErrorMessage('Login Successfully', context);
        Navigator.pushNamed(context, RouteName.homeView);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print(error.toString());
        Utils.flushBarErrorMessage(error.toString(), context);
      }
    });
  }
}

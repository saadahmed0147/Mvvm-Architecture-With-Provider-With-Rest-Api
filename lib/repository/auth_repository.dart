import 'package:mvvm_strructure/data/network/base_api_service.dart';
import 'package:mvvm_strructure/data/network/network_api_service.dart';
import 'package:mvvm_strructure/res/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.signUpUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}

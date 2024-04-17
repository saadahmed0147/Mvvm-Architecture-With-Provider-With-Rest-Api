import 'package:mvvm_strructure/data/response/enum.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;
  ApiResponse([this.data, this.message, this.status]);

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed() : status = Status.COMPLETED;
  ApiResponse.error() : status = Status.ERROR;

  @override
  String toString() {
    return "Status: $status \nMessage: $message\nData: $data";
  }
}

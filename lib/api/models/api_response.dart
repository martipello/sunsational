import 'error_response.dart';

sealed class ApiResponse<T> {}
class OnLoad<T> extends ApiResponse<T>{}
class OnError<T> extends ApiResponse<T>{

  OnError({this.error});
  final ErrorResponse? error;
}
class OnComplete<T> extends ApiResponse<T>{

  OnComplete(this.data);
  final T data;
}

extension ApiResponseExtension on ApiResponse {
  bool hasData() {
    final thisResponse = this;
    if(thisResponse is OnComplete) {
      return thisResponse.data != null;
    }
    return false;
  }

  T getData<T>() {
    final thisResponse = this;
    if(thisResponse is OnComplete<T>) {
      return thisResponse.data;
    }
    throw TypeError();
  }
}

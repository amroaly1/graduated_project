abstract class ApiResponse {
  dynamic data;

  String? errormessage;
  bool isProblemFromInternrt = true;

  ApiResponse(
      {this.data, this.errormessage, this.isProblemFromInternrt = true});
}

class ApiReponseSuccess extends ApiResponse {
  ApiReponseSuccess({required super.data});
}

class ApiResponseFailing extends ApiResponse {
  ApiResponseFailing(
      {required super.errormessage, required super.isProblemFromInternrt});
}

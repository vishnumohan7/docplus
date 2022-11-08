class ApiResponseModel {
  final bool status;
  final dynamic data;
  final String? message;
  final String? error;
  final String? token;
  final bool? isForceLogin;

  ApiResponseModel(
      {required this.status,
      this.data,
      this.message,
      this.error,
      this.token,
      this.isForceLogin});

  factory ApiResponseModel.fromJSON(Map<String, dynamic> json) {
    return ApiResponseModel(
        status: json["status"],
        data: json["data"],
        message: json["message"],
        error: json["error"],
        token: json["token"],
        isForceLogin: json["isForceLogin"]);
  }
}

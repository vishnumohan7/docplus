import 'package:proform1/src/helpers/api_helper.dart';
import 'package:proform1/src/models/api_response_model.dart';
import 'package:proform1/src/web_service/api_routes.dart';

class AuthRepository {
  Future<ApiResponseModel> login(String email, String password) async {
    Map<String, dynamic> data = {"email": email, "password": password};
    ApiResponseModel response =
        await ApiHelper().makePostRequest(ApiRoutes.loginRoute, data);
    return response;
  }

  Future<ApiResponseModel> changePassword(String currentPassword, String newPassword) async {
    Map<String, dynamic> data = {
      "currentPassword": currentPassword,
      "newPassword": newPassword
    };
    ApiResponseModel response =
        await ApiHelper().makePostRequest(ApiRoutes.changePasswordRoute, data);
    return response;
  }

  Future<ApiResponseModel> updateUser(Map<String, dynamic> updatedData) async {
    ApiResponseModel response = await ApiHelper()
        .makePatchRequest(ApiRoutes.updateUserRoute, updatedData);
    return response;
  }
}

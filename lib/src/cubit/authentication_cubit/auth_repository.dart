import 'dart:convert';

import 'package:proform1/src/helpers/api_helper.dart';
import 'package:proform1/src/helpers/storage_helper.dart';
import 'package:proform1/src/helpers/storage_key.dart';
import 'package:proform1/src/models/api_response_model.dart';
import 'package:proform1/src/models/user_response.dart';
import 'package:proform1/src/web_service/api_routes.dart';

class AuthRepository {
  Future<ApiResponseModel> login(String email, String password) async {
    Map<String, dynamic> data = {"email": email, "password": password};
    ApiResponseModel response =
        await ApiHelper().makePostRequest(ApiRoutes.loginRoute, data);
    return response;
  }

  Future<ApiResponseModel> changePassword(
      String currentPassword, String newPassword) async {
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

  Future<bool> checkAutoLogin() async {
    try {
      String? userDataJSON =
          await StorageHelper.readData(StorageKey.userData.name);
      String? jwtString = await StorageHelper.readData(StorageKey.jwt.name);
      if (userDataJSON == null || jwtString == null) {
        return false; //we cant do autologin
      }
      String? loginTimeString =
          await StorageHelper.readData(StorageKey.loginTime.name);
      if (userDataJSON == null ||
          jwtString == null ||
          loginTimeString == null) {
        return false;
      }
      UserResponse userData = UserResponse.fromJson(jsonDecode(userDataJSON));
      if (userData == null) {
        return false;
      } else {
        DateTime loginTime = DateTime.parse(loginTimeString);
        if (DateTime.now().difference(loginTime).inDays >= 2) {
          return false; // automatically logout user after 2 days
        }
        return true;
      }
    } catch (ex) {
      return false;
    }
  }
}

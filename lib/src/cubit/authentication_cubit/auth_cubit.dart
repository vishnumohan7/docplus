import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:proform1/src/cubit/authentication_cubit/auth_repository.dart';
import 'package:proform1/src/helpers/storage_helper.dart';
import 'package:proform1/src/helpers/storage_key.dart';
import 'package:proform1/src/models/api_response_model.dart';
import 'package:proform1/src/models/user_response.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  AuthRepository _repository = AuthRepository();

  login(String email, String password) async {
    emit(AuthLoading());
    try {
      ApiResponseModel response = await _repository.login(email, password);
      if (response.status) {
        UserResponse userData = UserResponse.fromJson(response.data);
        StorageHelper.writeData(StorageKey.jwt.name, response.token!);
        StorageHelper.writeData(
            StorageKey.userData.name,
            jsonEncode(userData
                .toJson())); //1st: convert object to key value pair 2: jsonEncode will convert key value par to string
        emit(AuthLoadSuccess());
      } else {
        String? errorMessage = response.error!;
        emit(AuthLoadFailure(errorMessage));
      }
    } catch (ex) {
      emit(AuthLoadFailure("Error Authenticating User"));
    }
  }
}

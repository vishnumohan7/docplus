import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:proform1/src/cubit/authentication_cubit/auth_repository.dart';
import 'package:proform1/src/helpers/storage_helper.dart';
import 'package:proform1/src/helpers/storage_key.dart';
import 'package:proform1/src/models/api_response_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  AuthRepository _repository = AuthRepository();

  login(String email, String password) async {
    emit(AuthLoading());
    try {
      ApiResponseModel response = await _repository.login(email, password);
      if (response.status) {
        StorageHelper.writeData(StorageKey.jwt.name, response.token!);
        emit(AuthLoadSuccess());
      } else {
        emit(AuthLoadFailure());
      }
    } catch (ex) {
      emit(AuthLoadFailure());
    }
  }
}

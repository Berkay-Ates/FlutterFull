import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/login_service.dart';
import '../model/login_model.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(ILoginService loginService)
      : _loginService = loginService,
        super(const LoginState());

  final ILoginService _loginService;

  Future<void> checkUser(String email, String passowd) async {
    emit(state.copyWith(isLoading: true, loginModel: LoginModel(email, passowd)));
    final response = await _loginService.login(state.loginModel!);
    //* force edebiliriz cunku herhangi email ve string objelerinin geldigini biliyoruz
    emit(state.copyWith(isLoading: false, isCompleted: (response?.data != null) ? true : false));
    inspect(response);
  }
}

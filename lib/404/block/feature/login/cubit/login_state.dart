import 'package:equatable/equatable.dart';

import '../model/login_model.dart';
import '../../../../../product/model/token_model.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final LoginModel? loginModel;
  final TokenModel? tokenModel;
  final bool isCompleted;
  const LoginState({this.isLoading = false, this.loginModel, this.isCompleted = false, this.tokenModel});

  @override
  List<Object?> get props => [isLoading, loginModel];

  LoginState copyWith({
    bool? isLoading,
    LoginModel? loginModel,
    TokenModel? tokenModel,
    bool? isCompleted,
  }) {
    return LoginState(
      isLoading: isLoading ?? false,
      loginModel: loginModel ?? this.loginModel,
      tokenModel: tokenModel ?? this.tokenModel,
      isCompleted: isCompleted ?? false,
    );
  }
  //* copy with metodu sayesinde halihazırda var olan obje yeniden oluşturuluren eski objenin verileri
  //* aynen kopyalanır sadece customer'in degistirmiş oldugu objeler degişmiş olut.
}

// class LoginInitial extends LoginState {}

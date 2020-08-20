import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest01/tips/bloc/login_cubit/model/base_login_model.dart';

///
/// Created by fgyong on 2020/8/19.
///

class LoginCubit extends Cubit<LoginModel> {
  LoginCubit(state) : super(state);
  void login() async {
    emit(state.copyWith(loginState: LoginState.isLoading));
    await Future.delayed(Duration(seconds: 2));
    if (state.btnVisiable == true)
      emit(state.copyWith(loginState: LoginState.success));
    emit(state.copyWith(loginState: LoginState.faild));
  }

  void logOut() async {
    emit(state.copyWith(
      name: null,
      pwd: null,
    ));
  }

  void changeName({String name}) {
    emit(state.copyWith(
        name: name, pwd: state.password, loginState: state.state));
  }

  void changePassword({String pwd}) {
    emit(state.copyWith(name: state.name, pwd: pwd, loginState: state.state));
  }
}

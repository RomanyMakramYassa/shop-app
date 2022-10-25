import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:itimsh/shopapp/login/cubit/stats.dart';
import '../../../../shared/network/remote/diohelper.dart';
import '../../../shop_login/logenmodel.dart';
import '../../home/consts.dart';

class LoginCubit extends Cubit<LoginStat> {
  LoginCubit() : super(LoginIntialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  void UserLogin({required String email, required String password}) {
    emit(LoginLoadingState());
    Diohelper.postdate(
        url: LogIn,
        ddata: {'email': email, 'password': password}).then((value) {
      print('sucess _cubit login ');
      print(value.data);
      ShoploginModel loginmodel = ShoploginModel.formJson(value.data);

      emit(LoginSucessState(loginmodel));
    }).catchError((onError) {
      print('eroror_cubit login');
      print(onError.toString());
      emit(LoginerorState(onError.toString()));
    });
  }

  Icon sufix = Icon(Icons.visibility_outlined);
  bool IsPass = true;
  void changrsufix() {
    IsPass = !IsPass;
    sufix = IsPass
        ? Icon(Icons.visibility_off_outlined)
        : Icon(Icons.visibility_outlined);
    emit(LoginChangPassState());
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

//import 'package:metest/modules/shopapp/login/cubit/stats.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:itimsh/shopapp/register/register_cubit/stats.dart';

import '../../../../shared/network/remote/diohelper.dart';
import '../../../shop_login/logenmodel.dart';
import '../../home/consts.dart';

class RegisterCubit extends Cubit<RegisterStat> {
  RegisterCubit() : super(RegisterIntialState());
  static RegisterCubit get(context) => BlocProvider.of(context);

  void RegisterLogin(
      {required String email,
      required String password,
      required String name,
      required String phone}) {
    emit(RegisterLoadingState());
    Diohelper.postdate(url: REGISTER, ddata: {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone
    }).then((value) {
      print('sucess _cubit login ');
      print(value.data);
      ShoploginModel Registermodel = ShoploginModel.formJson(value.data);

      emit(RegisterSucessState(Registermodel));
    }).catchError((onError) {
      print('eroror_cubit login');
      print(onError.toString());
      emit(RegistererorState(onError.toString()));
    });
  }

  Icon sufix = Icon(Icons.visibility_outlined);
  bool IsPass = true;
  void changrsufix() {
    IsPass = !IsPass;
    sufix = IsPass
        ? Icon(Icons.visibility_off_outlined)
        : Icon(Icons.visibility_outlined);
    emit(RegisterChangPassState());
  }
}

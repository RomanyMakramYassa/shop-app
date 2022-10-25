

import '../../../shop_login/logenmodel.dart';

abstract class LoginStat {}

class LoginIntialState extends LoginStat {}

class LoginLoadingState extends LoginStat {}

class LoginSucessState extends LoginStat {
  final ShoploginModel loginmode;
  LoginSucessState(this.loginmode);
}

class LoginerorState extends LoginStat {
  final String eror;
  LoginerorState(this.eror);
}

class LoginChangPassState extends LoginStat {}

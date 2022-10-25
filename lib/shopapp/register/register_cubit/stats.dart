

import '../../../shop_login/logenmodel.dart';

abstract class RegisterStat {}

class RegisterIntialState extends RegisterStat {}

class RegisterLoadingState extends RegisterStat {}

class RegisterSucessState extends RegisterStat {
  final ShoploginModel Registermode;
  RegisterSucessState(this.Registermode);
}

class RegistererorState extends RegisterStat {
  final String eror;

  RegistererorState(this.eror);
}

class RegisterChangPassState extends RegisterStat {}

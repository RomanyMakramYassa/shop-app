import '../../shop_login/favoritemodel.dart';
import '../../shop_login/logenmodel.dart';

abstract class ShopStates {}

class ShopIntialStat extends ShopStates {}

class ShopBotonNavStat extends ShopStates {}

class ShopLoadingHomeDataStates extends ShopStates {}

class ShopSuccessHomeDataStates extends ShopStates {}

class ShopErrorHomeDataStates extends ShopStates {}

class ShopSuccesscatogryStates extends ShopStates {}

class ShopErrorcatogryStates extends ShopStates {}

class ShopchangeladimgStates extends ShopStates {}

class ShopSuccessfavoriteStates extends ShopStates {
  final ChangeFavoriteModel model;
  ShopSuccessfavoriteStates(this.model);
}

class ShopErrorfavoriteStates extends ShopStates {}

class ShopSuccessgetfavofriteStates extends ShopStates {}

class ShopErrorgetfavoriteStates extends ShopStates {}

class ShopgetloadingfavoriteStates extends ShopStates {}

class ShopSuccessgetuserdataStates extends ShopStates {
  final ShoploginModel logonmodel;

  ShopSuccessgetuserdataStates(this.logonmodel);
}

class ShopErrorgetuserdataStates extends ShopStates {}

class ShopgetloadinguserdataStates extends ShopStates {}

class ShopSuccessupdateuserdataStates extends ShopStates {
  final ShoploginModel logonmodel;

  ShopSuccessupdateuserdataStates(this.logonmodel);
}

class ShopErrorupdateuserdataStates extends ShopStates {}

class ShopgetloadingupdatedataStates extends ShopStates {}

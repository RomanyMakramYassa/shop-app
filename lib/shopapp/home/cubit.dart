import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itimsh/shopapp/home/states.dart';


import '../../shared/network/remote/diohelper.dart';
import '../../shop_login/catogrymodel.dart';
import '../../shop_login/favoritemodel.dart';
import '../../shop_login/favoritemooodelnot change.dart';
import '../../shop_login/homeModel.dart';
import '../../shop_login/logenmodel.dart';
import '../catogires/catogres.dart';
import '../favorites/favorites.dart';
import '../product/products.dart';
import '../sittings/sittings.dart';
import 'consts.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopIntialStat());
  static ShopCubit get(context) => BlocProvider.of(context);
  int curentindex = 0;
  List<Widget> botomScren = [
    ProductScreen(),
    CatogryScreen(),
    FavoriteScreen(),
    SittingScreen(),
  ];
  void changebotonscreen(index) {
    curentindex = index;
    emit(ShopBotonNavStat());
  }

  HomeModel? model;
  Map<int?, bool?> Favorite = {};
  void getHomeDate() {
    emit(ShopLoadingHomeDataStates());

    Diohelper.getdate(url: HOME, taken: token).then((value) {
      model = HomeModel.fromjson(value.data);
      print(value.data.toString());
      print('suces_cubit shop');
      model?.data!.productlist.forEach((element) {
        Favorite.addAll({
          element.id: element.favorite,
        });
      });
      emit(ShopSuccessHomeDataStates());
    }).catchError((onError) {
      emit(ShopErrorHomeDataStates());
      print(onError.toString());
      print('error_cubit shop');
    });
  }

  CatogryModel? catmodel;
  void getCatogryDate() {
    Diohelper.getdate(url: getcatogry, taken: token).then((value) {
      catmodel = CatogryModel.fromjson(value.data);
      print(value.data.toString());

      print('suces_cubit shop');
      emit(ShopSuccesscatogryStates());
    }).catchError((onError) {
      emit(ShopErrorcatogryStates());
      print(onError.toString());
      print('error_cubit shop');
    });
  }

  // favorite
  ChangeFavoriteModel? changeFavoriteModel;

  void changefavorite(int productid) {
    // Favorite[productid] = !Favorite[productid]!;
    emit(ShopchangeladimgStates());
    Diohelper.postdate(
            url: pFavorite, ddata: {'product_id': productid}, Taken: token)
        .then((value) {
      print(value.data);
      changeFavoriteModel = ChangeFavoriteModel.fromjson(value.data);
//changeFavoriteModel?.State!
      if (!changeFavoriteModel!.State) {
        Favorite[productid] = !Favorite[productid]!;
      } else {
        getfavoriteDate();
      }
      emit(ShopSuccessfavoriteStates(changeFavoriteModel!));
    }).catchError((onError) {
      // Favorite[productid] = !Favorite[productid]!;
      emit(ShopErrorfavoriteStates());
    });
  }

  FavoriteModel? favoriteModel;
  void getfavoriteDate() {
    emit(ShopgetloadingfavoriteStates());
    Diohelper.getdate(url: pFavorite, taken: token).then((value) {
      favoriteModel = FavoriteModel.fromJson(value.data);
      print(value.data.toString());

      print('suces get favorite');
      emit(ShopSuccessgetfavofriteStates());
    }).catchError((onError) {
      emit(ShopErrorgetfavoriteStates());
      print(onError.toString());
      print('error_get favorite');
    });
  }

  ShoploginModel? userModel;
  void getuserDate() {
    emit(ShopgetloadinguserdataStates());
    Diohelper.getdate(url: Profile, taken: token).then((value) {
      userModel = ShoploginModel.formJson(value.data);
      print(value.data.toString());

      print('suces get user data');
      emit(ShopSuccessgetuserdataStates(userModel!));
    }).catchError((onError) {
      emit(ShopErrorgetuserdataStates());
      print(onError.toString());
      print('error_get user data');
    });
  }

  void UpdateuserDate({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(ShopgetloadingupdatedataStates());
    Diohelper.putdate(
        url: Update,
        Taken: token,
        ddata: {'name': name, 'phone': phone, 'email': email}).then((value) {
      userModel = ShoploginModel.formJson(value.data);
      print(value.data.toString());

      print('suces update user data');
      emit(ShopSuccessupdateuserdataStates(userModel!));
    }).catchError((onError) {
      emit(ShopErrorupdateuserdataStates());
      print(onError.toString());
      print('error_update user data');
    });
  }
}

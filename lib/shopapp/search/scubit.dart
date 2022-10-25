import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itimsh/shopapp/search/sstate.dart';

import '../../shared/network/remote/diohelper.dart';
import '../../shop_login/searchmooodel.dart';
import '../home/consts.dart';

class SearchCubit extends Cubit<Searchstate> {
  SearchCubit() : super(SearchIntialState());
  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? model;
  void Searchproduct({required String? text}) {
    emit(SearchLeadingState());
    Diohelper.postdate(url: SEARCH, Taken: '', ddata: {"text": text})
        .then((value) {
      print('gjhghjg');
      model = SearchModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).catchError((onError) {
      print('hgfhgfhgfh');
      emit(SearchErrorState());
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itimsh/shopapp/home/states.dart';

import '../../../shared/coponanet/coponanet.dart';
import '../search/search.dart';
import 'cubit.dart';

class HLogin extends StatelessWidget {
  const HLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = ShopCubit.get(context);

    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, states) {},
        builder: (context, states) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Salle'),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigateto(context, SearchScreen());
                    },
                    icon: Icon(Icons.search))
              ],
            ),
            body: cubit.botomScren[cubit.curentindex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubit.changebotonscreen(index);
              },
              currentIndex: cubit.curentindex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.apps), label: 'Catogry'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Favorite'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Settings')
              ],
            ),
            /*TextButton(
              child: Text('Sign Out'),
              onPressed: () {
                SignOut(context);
                //  CachHelper.removedata(key: 'token').then((value) {
                //  if (value) {
                //  Navigatefinish(context, ShopLogin());
                // }
                // });
              },
            ),*/
          );
        });
  }
}

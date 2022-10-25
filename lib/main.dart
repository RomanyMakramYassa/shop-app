import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:itimsh/shared/cubit/cubit.dart';
import 'package:itimsh/shared/cubit/states.dart';
import 'package:itimsh/shared/network/local/cachhelper.dart';
import 'package:itimsh/shared/network/remote/diohelper.dart';
import 'package:itimsh/shared/styles/bloc_opserfer/bloc.dart';
import 'package:itimsh/shared/styles/themes.dart';
import 'package:itimsh/shopapp/home/cubit.dart';
import 'package:itimsh/shopapp/home/login.dart';
import 'package:itimsh/shopapp/login/login.dart';
import 'package:itimsh/shopapp/on%20bording/onBORDING.dart';
import 'package:itimsh/test.dart';

import 'NewsApp/cubit.dart';

//import 'package:metest/layout/shopapp/on%20bording/onBORDING.dart';
//import 'package:metest/layout/shopapp/on%20bording/onbordingscreen.dart';
//import 'package:metest/modules/counter/counter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () {
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
  Diohelper.init();
  await CachHelper.init();
  Widget Screen;

  bool? onboarding = CachHelper.getdatashop(key: 'onboarding');
  String? token = CachHelper.getdatashop(key: 'token');
  print(onboarding.toString());
  bool? isDark = CachHelper.getdata(key: 'isDark');
  if (onboarding != null) {
    if (token != null)
      Screen = HLogin();
    else
      Screen = ShopLogin();
  } else {
    Screen = ONBording();
  }
  Screen = ONBording();
  runApp(MyApp(
    isDark: isDark,
    Screen: Screen,
  ));

  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp(bool bool,
  //   {Key? key,this.isDark,this.onboarding})
  // : super(key: key);
  final bool? isDark;
  final Widget? Screen;
  MyApp({this.isDark, this.Screen});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => NewsCubit()
              ..getbusiness()
              ..GetScience()
              ..GetSports()),
        BlocProvider(create: (context) => AppCubit()..changmode(fromn: isDark)),
        BlocProvider(
            create: (context) => ShopCubit()
              ..getHomeDate()
              ..getCatogryDate()
              ..getfavoriteDate()
              ..getuserDate())
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            //  home: BMI(),
            //home: hoooome(),
            //  home: Home_Layout(),
            //home: Text('sdfghjk'),

            //  home: CounterScreen(),
            /// nwewssssssssssssssssssss
            ///
            theme: lighttheme,
            darkTheme: derktheme,
            themeMode: AppCubit.getApp(context).isdark
                ? ThemeMode.dark
                : ThemeMode.light,

            // home: NewsScreen(),
            home: Screen,

            // home: onboarding? ShopLogin():ONBording()
            //home: Users(),
          );
        },
      ),
    );
  }
}

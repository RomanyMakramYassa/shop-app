//import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
//import 'dart:html';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../../../shared/coponanet/coponanet.dart';
import '../../shared/network/local/cachhelper.dart';
import '../home/consts.dart';
import '../home/login.dart';
import '../register/registerscreen.dart';
import 'cubit/cubit.dart';
import 'cubit/stats.dart';

var frmKey = GlobalKey<FormState>();
var emailcontroler = TextEditingController();
var passcontrolar = TextEditingController();

class ShopLogin extends StatelessWidget {
  const ShopLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStat>(listener: (context, state) {
        //print(state.loginmode.massege);
        if (state is LoginSucessState) {
          if (state.loginmode.status!) {
            print('hna');
            print(state.loginmode.data);
            print(state.loginmode.status);
            Fluttertoast.showToast(
                msg: state.loginmode.massege!,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);

            print(state.loginmode.data!.token);
            // Navigatefinish(context, HLogin());
            CachHelper.savedata(key: 'token', val: state.loginmode.data!.token)
                .then((value) {
              token = state.loginmode.data!.token!;
              Navigatefinish(context, HLogin());
            });
          } else {
            print('hnak');
            print(state.loginmode.massege);
            Showtost(text: state.loginmode.massege!, state: teaststates.ERROR);
          }
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(20.00),
                  child: Form(
                    key: frmKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontSize: 50.00),
                        ),
                        SizedBox(
                          height: 2.00,
                        ),
                        Text(
                          'Login Now to our page to get offers',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 4.00,
                        ),
                        TextFormField(
                          controller: emailcontroler,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefix: Icon(Icons.mail),
                            label: Text('email'),
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'must add email';
                            }
                          },
                        ),
                        SizedBox(
                          height: 15.00,
                        ),
                        TextFormField(
                          controller: passcontrolar,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: LoginCubit.get(context).IsPass,
                          onFieldSubmitted: (valu) {
                            if (frmKey.currentState!.validate()) {
                              LoginCubit.get(context).UserLogin(
                                  email: emailcontroler.text,
                                  password: passcontrolar.text);
                            }
                            ;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefix: Icon(Icons.lock),
                            suffix: IconButton(
                              icon: LoginCubit.get(context).sufix,
                              onPressed: () {
                                LoginCubit.get(context).changrsufix();
                              },
                            ),
                            label: Text('Password'),
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Password is to short ';
                            }
                          },
                        ),
                        SizedBox(
                          height: 15.00,
                        ),
                        ConditionalBuilder(
                            condition: state is! LoginLoadingState,
                            builder: (context) => Container(
                                  width: double.infinity,
                                  color: Colors.blue,
                                  child: MaterialButton(
                                    onPressed: () {
                                      if (frmKey.currentState!.validate()) {
                                        LoginCubit.get(context).UserLogin(
                                            email: emailcontroler.text,
                                            password: passcontrolar.text);
                                        // Navigatefinish(context, HLogin());

                                      }
                                    },
                                    child: Text(
                                      'LOgin'.toUpperCase(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                            fallback: (context) => Center(
                                  child: CircularProgressIndicator(),
                                )),
                        /*    ConditionalBuilder(
                                condition: true, //states is! LoginLoadingState,
                                builder: (context) => defultbouton(
                                    text: 'Login',
                                    function: () {
                                      print('ghgh');

                                      if (frmKey.currentState!.validate()) {
                                        LoginCubit.get(context).UserLogin(
                                            email: emailcontroler.text,
                                            Password: passcontrolar.text);
                                      }
                                    }),
                                fallback: (context) => Center(
                                      child: CircularProgressIndicator(),
                                    )),*/
                        SizedBox(
                          height: 10.00,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Dont Have An Account?'),
                            TextButton(
                                onPressed: () {
                                  Navigateto(context, registerScreen());
                                },
                                child: Text('Regester')),
                          ],
                        )
                      ],
                    ),
                  )),
            ),
          ),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/coponanet/costant.dart';
import '../home/cubit.dart';
import '../home/states.dart';

class SittingScreen extends StatelessWidget {
  const SittingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    var phonecontrol = TextEditingController();
    var namecontrol = TextEditingController();
    var emailcontrol = TextEditingController();
    return BlocConsumer<ShopCubit, ShopStates>(listener: (context, state) {
      if (state is ShopSuccessgetuserdataStates) {
        phonecontrol.text = state.logonmodel.data!.phone!;
        emailcontrol.text = state.logonmodel.data!.email!;
        namecontrol.text = state.logonmodel.data!.name!;
      }
    }, builder: (context, state) {
      var model = ShopCubit.get(context).userModel;
      phonecontrol.text = model!.data!.phone!;
      namecontrol.text = model.data!.name!;
      emailcontrol.text = model.data!.email!;
      return Form(
        key: formkey,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              if (state is ShopgetloadingupdatedataStates)
                LinearProgressIndicator(),
              TextFormField(
                controller: namecontrol,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text('Name'),
                  border: OutlineInputBorder(),
                  prefix: Icon(Icons.person),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'name is empty';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailcontrol,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text('email'),
                  border: OutlineInputBorder(),
                  prefix: Icon(Icons.email),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'email is empty';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: phonecontrol,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text('phone'),
                  border: OutlineInputBorder(),
                  prefix: Icon(Icons.phone_android),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'phone is empty';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              //   defultbouton(function: function, text: text)
              Container(
                color: Colors.blue,
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      ShopCubit.get(context).UpdateuserDate(
                          phone: phonecontrol.text,
                          name: namecontrol.text,
                          email: emailcontrol.text);
                    }
                  },
                  child: Text(
                    'Update'.toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //   defultbouton(function: function, text: text)
              Container(
                color: Colors.blue,
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    SignOut(context);
                  },
                  child: Text(
                    'Logout'.toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

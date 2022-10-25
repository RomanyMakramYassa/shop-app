import 'package:flutter/material.dart';
import 'package:itimsh/shared/coponanet/coponanet.dart';
import 'package:itimsh/todoApp/tasks/tasks.dart';

var passcontrolar = TextEditingController();
var passcontrolar2 = TextEditingController();
var passcontrolar3 = TextEditingController();
var passcontrolar4 = TextEditingController();
var frm = GlobalKey<FormState>();

class testt extends StatelessWidget {
  const testt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
      child: Column(
        children: [
          defultTxtform(
              onchanget: () {},
              onsubmitt: () {},
              ontap: () {},
              TextInT: TextInputType.visiblePassword,
              valedate: (val) {
                if (val!.isEmpty) {
                  return 'Password is to short ';
                }
              },
              obsu: true,
              label: 'hhh',
              icn: Icons.add_chart,
              controller: passcontrolar),
          Divider(),
          defultTxtform(
              onchanget: () {},
              onsubmitt: () {},
              ontap: () {},
              TextInT: TextInputType.text,
              //sufex: Icons.add,
              valedate: (val) {
                if (val!.isEmpty) {
                  return 'Password is to short ';
                }
              },
              label: 'hhh',
              icn: Icons.add_chart,
              controller: passcontrolar2),
          defultTxtform(
              onchanget: () {},
              onsubmitt: () {},
              ontap: () {},
              TextInT: TextInputType.visiblePassword,
              valedate: (val) {
                if (val!.isEmpty) {
                  return 'Password is to short ';
                }
              },
              label: 'hhh',
              icn: Icons.add_chart,
              controller: passcontrolar3),
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: MaterialButton(
              onPressed: () {
                if (frm.currentState!.validate()) {
                  Navigatefinish(context, Task());
                }
              },
              child: Text(
                'LOgin'.toUpperCase(),
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      key: frm,
    )));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shop_login/catogrymodel.dart';
import '../home/cubit.dart';
import '../home/states.dart';

class CatogryScreen extends StatelessWidget {
  const CatogryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView.separated(
              itemBuilder: (context, index) => CatogryItem(
                  ShopCubit.get(context).catmodel!.data.data[index]),
              separatorBuilder: (context, index) => Divider(),
              itemCount: ShopCubit.get(context).catmodel!.data.data.length);
        });
  }

  Widget CatogryItem(Datamodel model) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Image(
            image: NetworkImage(model.image),
            height: 90,
            width: 90,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            model.name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_rounded),
        ],
      ),
    );
  }
}

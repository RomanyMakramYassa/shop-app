import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shop_login/favoritemooodelnot change.dart';
import '../home/cubit.dart';
import '../home/states.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView.separated(
            itemBuilder: (context, index) => buildfavoriteitrm(
                ShopCubit.get(context).favoriteModel!.data!.data[index].product,
                context),
            separatorBuilder: (context, index) => Divider(),
            itemCount: ShopCubit.get(context).favoriteModel!.data!.data.length,
          );
        });
  }

  Widget buildfavoriteitrm(Product model, context) => Padding(
        padding: EdgeInsets.all(4),
        child: Container(
          // padding: EdgeInsets.all(10),
          height: 120,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage('${model.image}'),
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                  if (model.discount != 0)
                    Container(
                      color: Colors.red,
                      child: Text(
                        'dicoiunt',
                      ),
                    )
                ],
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model.name}',
                    style: TextStyle(height: 1.3),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  //  Spacer(),
                  Row(
                    children: [
                      Text(
                        '${model.price}',
                        style: TextStyle(height: 1.3),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: 3.00,
                      ),
                      if (model.discount != 0)
                        Text(
                          '${model.old_price}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.green, fontStyle: FontStyle.italic),
                        ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          ShopCubit.get(context).changefavorite(model.id!);
                        },
                        icon: CircleAvatar(
                          radius: 15,
                          backgroundColor: // ShopCubit.get(context)
                              //     .Favorite[model.product!.id]!
                              //   ? Colors.blue
                              //    :
                              Colors.grey,
                          child: Icon(
                            Icons.favorite_border_outlined,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
            ],
          ),
        ),
      );
}

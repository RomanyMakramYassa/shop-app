import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/coponanet/coponanet.dart';
import '../../shop_login/catogrymodel.dart';
import '../../shop_login/homeModel.dart';
import '../home/cubit.dart';
import '../home/states.dart';

//import 'package:metest/modules/shopapp/on%20bording/onBORDING.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var modelcat = ShopCubit.get(context).catmodel;
    //var c = ShopCubit.get(context).getHomeDate();
    var moodel = ShopCubit.get(context).model;
    //HomeModel mod;
    return BlocConsumer<ShopCubit, ShopStates>(listener: (context, states) {
      if (states is ShopSuccessfavoriteStates) {
        if (!states.model.State) {
          Showtost(text: states.model.message, state: teaststates.ERROR);
        }
      }
    }, builder: (context, states) {
      return ConditionalBuilder(
          condition: ShopCubit.get(context).model != null &&
              ShopCubit.get(context).catmodel != null,
          builder:
              (context) => /* SingleChildScrollView(
                    child: Column(
                      children: [
                        CarouselSlider(
                          items: moodel?.data!.banerslist
                              .map((e) => Image(
                                    image: NetworkImage('${e.image}'),
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ))
                              .toList(),
                          options: CarouselOptions(
                              height: 250,
                              initialPage: 0,
                              reverse: false,
                              autoPlay: true,
                              enableInfiniteScroll: true,
                              scrollDirection: Axis.horizontal,
                              autoPlayInterval: Duration(seconds: 1),
                              autoPlayAnimationDuration: Duration(seconds: 2),
                              autoPlayCurve: Curves.fastOutSlowIn),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Catogry',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                BuildCatogry(modelcat!.data.data[index]),
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 10.00,
                                ),
                            itemCount: modelcat!.data.data.length),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'New product',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          color: Colors.red,
                          child: GridView.count(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              mainAxisSpacing: 10.00,
                              crossAxisSpacing: 10.00,
                              children: List.generate(
                                  moodel!.data!.productlist.length,
                                  (index) => ductBuild(
                                      moodel.data!.productlist[index]))),
                        )
                      ],
                    ),
                  ),*/
                  ProductBuild(ShopCubit.get(context).model,
                      ShopCubit.get(context).catmodel, context),
          /*
              //canreplace SingleChildScrollView
              with--
         ProductBuild(ShopCubit.get(context).model,ShopCubit.get(context).catmodel )
              */
          fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ));
    });
  }

  Widget ProductBuild(HomeModel? model, CatogryModel? Cmodel, context) =>
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: model?.data!.banerslist
                  .map((e) => Image(
                      image: NetworkImage('${e.image}'),
                      width: double.infinity,
                      fit: BoxFit.cover))
                  .toList(),
              options: CarouselOptions(
                  height: 250,
                  initialPage: 0,
                  reverse: false,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: true,
                  scrollDirection: Axis.horizontal,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(seconds: 2),
                  autoPlayCurve: Curves.fastOutSlowIn),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Catogry',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 100,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      BuildCatogry(Cmodel!.data.data[index]),
                  separatorBuilder: (context, index) => SizedBox(
                        width: 10.00,
                      ),
                  itemCount: Cmodel!.data.data.length),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'New product',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 5.00,
                  crossAxisSpacing: 10.00,
                  childAspectRatio: 1 / 1.7,
                  children: List.generate(
                      model!.data!.productlist.length,
                      (index) =>
                          ductBuild(model.data!.productlist[index], context))),
            ),
          ],
        ),
      );

  Widget ductBuild(product model, context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage('${model.image}'),
                height: 200,
                width: double.infinity,
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
          Column(
            children: [
              Text(
                '${model.name}',
                style: TextStyle(height: 1.3),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
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
                      backgroundColor:
                          //ShopCubit.get(context).Favorite[model.id!]!
                          //  ? Colors.blue
                          //        :
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
          )
        ],
      );

  Widget BuildCatogry(Datamodel mood) => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image(
            image: NetworkImage(mood.image),
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.6),
            width: 100,
            child: Text(
              mood.name,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      );
}

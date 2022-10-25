import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:itimsh/shopapp/search/scubit.dart';
import 'package:itimsh/shopapp/search/sstate.dart';

//import '../../../shared/coponanet/coponanet.dart';

import '../../shop_login/searchmooodel.dart';
import '../home/cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var TextContraler = TextEditingController();
    var Fromkey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, Searchstate>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Form(
                  key: Fromkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: TextContraler,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('Search'),
                            prefix: Icon(Icons.search),
                          ),
                          validator: (valio) {
                            if (valio!.isEmpty) {
                              return 'must add text to search';
                            } else {
                              return null;
                            }
                          },
                          onFieldSubmitted: (String text) {
                            SearchCubit.get(context).Searchproduct(text: text);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      if (state is SearchLeadingState)
                        LinearProgressIndicator(),
                      SizedBox(
                        height: 10,
                      ),
                      if (state is SearchSuccessState)
                        Expanded(
                            child: ListView.separated(
                          itemBuilder: (context, index) => buildfavoriteitrm(
                              SearchCubit.get(context).model!.data!.data[index],
                              context,
                              oldprise: false),
                          separatorBuilder: (context, index) => Divider(),
                          itemCount:
                              SearchCubit.get(context).model!.data!.data.length,
                        )),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget buildfavoriteitrm(Product model, context, {bool oldprise = true}) =>
      Padding(
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
                  if (model.discount != 0 && oldprise)
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
                      if (model.discount != 0 && oldprise)
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

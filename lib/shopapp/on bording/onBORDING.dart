import 'package:flutter/material.dart';

//import 'package:metest/layout/shopapp/login/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

//import '../../../layout/shopapp/login/login.dart';
import '../../../shared/coponanet/coponanet.dart';
import '../../../shared/styles/color.dart';
import '../../shared/network/local/cachhelper.dart';
import '../login/login.dart';

BuildContext? context;

class BordingModel {
  final String image;
  final String Title;
  final String Body;
  final String image2;
  BordingModel(
      {required this.image,
      required this.Title,
      required this.Body,
      required this.image2});
}

void Submitted() {
  CachHelper.savedata(key: 'onboarding', val: true).then((value) {
    if (value) {
      Navigatefinish(
        context,
        ShopLogin(),
      );
//      Navigator.pushAndRemoveUntil(BuildContext context, MaterialPageRoute(builder: (context)=>ShopLogin()), (route) => false)
      // Navigator.push(, MaterialPageRoute(builder: ( context) =>ShopLogin())
      // );
    }
  });
}

class ONBording extends StatefulWidget {
  const ONBording({Key? key}) : super(key: key);

  @override
  State<ONBording> createState() => _ONBordingState();
}

class _ONBordingState extends State<ONBording> {
  @override
  var bordControaler = PageController();
  List<BordingModel> Bordinglist = [
    BordingModel(
        image: 'images/onB.png',
        Title: 'romany shop app',
        Body: 'one',
        image2: 'images/me.jpg'),
    BordingModel(
        image: 'images/on2.jpg',
        Title: 'this first app for me',
        Body: 'two',
        image2: 'images/me.jpg'),
    BordingModel(
        image: 'images/on3.png',
        Title: 'wait',
        Body: 'three',
        image2: 'images/me.jpg'),
  ];
  bool ispage = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigatefinish(context, ShopLogin());
                //Submitted();
                CachHelper.savedata(key: 'onboarding', val: true);
              },
              child: Text(
                'Skip',
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.00),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (int v) {
                    if (v == Bordinglist.length - 1) {
                      setState(() {
                        ispage = true;
                      });
                    } else {
                      setState(() {
                        ispage = false;
                      });
                    }
                  },
                  controller: bordControaler,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      BuildBoard(Bordinglist[index]),
                  itemCount: Bordinglist.length,
                ),
              ),
              SizedBox(
                height: 30.00,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: bordControaler,
                    count: Bordinglist.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: defultColor,
                      dotColor: Colors.grey,
                      dotHeight: 10.00,
                      dotWidth: 10.00,
                      expansionFactor: 4.00,
                      spacing: 5,
                    ),
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (ispage == true) {
                        //Submitted();
                        CachHelper.savedata(key: 'onboarding', val: true)
                            .then((value) {
                          if (value) {
                            Navigatefinish(
                              context,
                              ShopLogin(),
                            );
//      Navigator.pushAndRemoveUntil(BuildContext context, MaterialPageRoute(builder: (context)=>ShopLogin()), (route) => false)
                            // Navigator.push(, MaterialPageRoute(builder: ( context) =>ShopLogin())
                            // );
                          }
                        });
                      } else {
                        bordControaler.nextPage(
                            duration: Duration(microseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    child: Icon(Icons.arrow_forward_rounded),
                  ),
                ],
              )
            ],
          )),
    );
  }

  Widget BuildBoard(BordingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage('${model.image}')),
          SizedBox(
            height: 10.00,
          ),
          Text(
            '${model.Title} ',
            style: TextStyle(fontSize: 24.00, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.00,
          ),
          Text(
            '${model.Title}',
            style: TextStyle(fontSize: 14.00, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 200,
              child: Image(image: AssetImage('${model.image2}')),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ],
      );
}

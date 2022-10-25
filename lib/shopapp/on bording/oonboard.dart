import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../shared/network/local/cachhelper.dart';
import '../../../shared/styles/color.dart';
import '../login/login.dart';

class BordingModel {
  final String image;
  final String Title;
  final String Body;
  BordingModel({required this.image, required this.Title, required this.Body});
}

void Submitted() {
  CachHelper.savedata(key: 'onboarding', val: true).then((value) {
    if (value) {
      // Navigatefinish(
      // context ,
      //ShopLogin(),

    }
  });
}

class ONBording extends StatefulWidget {
  const ONBording({Key? key}) : super(key: key);

  @override
  State<ONBording> createState() => _ONBordingState();
}

class _ONBordingState extends State<ONBording> {
  var bordControaler = PageController();
  List<BordingModel> Bordinglist = [
    BordingModel(
        image: 'images/onB.png', Title: 'Title Bord 1', Body: 'Body board 1'),
    BordingModel(
        image: 'images/onB.png', Title: 'Title Board 2', Body: 'Body Board 2'),
    BordingModel(
        image: 'images/onB.png', Title: 'Title Bord 3', Body: 'Body Board 3'),
  ];
  bool ispage = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                //  Navigatefinish(context, ShopLogin());
                Submitted();
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
                        Submitted();
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
        ],
      );
}

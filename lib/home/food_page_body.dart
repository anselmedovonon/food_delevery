import 'package:flutter/material.dart';
import 'package:food_delevery/colors.dart';
import 'package:food_delevery/small_text.dart';
import 'package:food_delevery/widgets/app_column.dart';
import 'package:food_delevery/widgets/big_text.dart';
import 'package:food_delevery/widgets/icon_and_text_widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get_core/src/get_main.dart';

import '../dimensions.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        print("Current value is $_currPageValue");
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
          ),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            color: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        SizedBox(height: Dimensions.heigth30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: Colors.black54),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: SmallText(text: "Food pairing"),
              ),
            ],
          ),
        ),
        // List of food and images
        Container(
          height: 700,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            //shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20 , bottom: Dimensions.heigth10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(


                        width: Dimensions.listViewImgSize,
                        height:  Dimensions.listViewImgSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.raduis20),
                          color: Colors.white38,
                          image: DecorationImage(
                            image: NetworkImage("https://media.istockphoto.com/id/638182056/fr/photo/famille-%C3%A0-la-cuisine-faire-des-cookies.jpg?s=1024x1024&w=is&k=20&c=GyObky7_zclJ84jZ5xBZ2GZH4Z1irB6g1EdCosqhwSI="),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 100,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.raduis20),
                              bottomRight: Radius.circular(Dimensions.raduis20)

                            ),
                            color: Colors.white,
                          ),
                          child: Padding(padding: EdgeInsets.only(left: Dimensions.width10 , right: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              BigText(text: "Nutrious fruit meal in China"),
                              SizedBox(height: Dimensions.heigth10,),
                              SmallText(text: "With chinese characteristics"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconAndTextWidget(
                                    icon: Icons.circle_sharp,
                                    text: "Normal",
                                    iconColor: AppColors.iconColor,
                                  ),
                                  IconAndTextWidget(
                                    icon: Icons.location_on,
                                    text: "1.7km",
                                    iconColor: AppColors.mainColor,
                                  ),
                                  IconAndTextWidget(
                                    icon: Icons.access_time_rounded,
                                    text: "32min",
                                    iconColor: AppColors.iconColor,
                                  ),
                                ],
                              )

                            ],
                          ),
                          ),


                        ),

                      )
                    ],
                  ),
                );
              }
          ),
        )

      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix4 = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currTrans, 1);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currTrans, 1);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.raduis30),
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://cdn.pixabay.com/photo/2018/11/24/19/38/recipe-3836174_1280.jpg",
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.heigth30,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.raduis20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                  BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimensions.heigth15,
                  left: 15,
                  right: 15,
                ),
                child: AppColumn(text: "Chinese Side",),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

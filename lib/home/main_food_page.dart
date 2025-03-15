import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delevery/colors.dart';
import 'package:food_delevery/dimensions.dart';
import 'package:food_delevery/small_text.dart';
import 'package:food_delevery/widgets/big_text.dart';

import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("current height is "+MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: Column(
        children: [

          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.heigth45, bottom: Dimensions.heigth15),
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Cotonou",
                        color: AppColors.mainColor,
                        size: 20,
                      ),
                      Row(
                        children: [
                          SmallText(text: "Bénin", color: Colors.black54),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.heigth45,
                      height: Dimensions.heigth45,
                      child: Icon(Icons.search, color: Colors.white, size:Dimensions.iconSize),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.raduis15),
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          FoodPageBody(),

        ],
      ),
    );
  }
}

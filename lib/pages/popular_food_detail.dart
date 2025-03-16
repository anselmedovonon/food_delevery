import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delevery/app_icon.dart';
import 'package:food_delevery/colors.dart';
import 'package:food_delevery/dimensions.dart';
import 'package:food_delevery/widgets/app_column.dart';
import 'package:food_delevery/widgets/big_text.dart';
import 'package:food_delevery/widgets/exandalble_text_widget.dart';


class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(

                  image: DecorationImage(image:
                  NetworkImage("https://media.istockphoto.com/id/1160700255/photo/woman-baking-muffins.jpg?s=1024x1024&w=is&k=20&c=IdNKf5TQ87r1A73_CbPnszfELVvRgQf7B6bKWHosT-A=")
                  )
                ),
                
              )

          ),
          // icon widget
          Positioned(
            top: Dimensions.heigth45,
              left: Dimensions.width20,
              right: Dimensions.width20,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    AppIcon(icon:
                   Icons.arrow_back_ios ),
                  AppIcon(icon:
                  Icons.shopping_cart_outlined )
                ],
              )),
          // introductions
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize-50,
              child: Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right:  Dimensions.width20,
                  top: Dimensions.heigth20
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(

                    topLeft: Radius.circular(Dimensions.raduis20),
                    topRight: Radius.circular(Dimensions.raduis20),
                    
                  ),
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: "Chinese Side",),
                    SizedBox(height: Dimensions.heigth20,),
                    BigText(text: "Introduce"),
                    ExandalbleTextWidget(text: "Savourez notre irrésistible lasagne maison, un plat généreux composé de fines couches de pâtes fraîches, garnies d’une sauce bolognaise mijotée longuement à base de viande hachée tendre, de tomates bien mûres, d’oignons fondants et d’herbes aromatiques, le tout nappé d’une onctueuse béchamel faite maison au beurre et au lait entier, puis parsemé de fromage râpé fondant gratiné au four jusqu’à obtenir une croûte dorée et croustillante, idéale pour un dîner convivial et réconfortant, à accompagner d’une salade verte légèrement vinaigrée et d’un bon pain croustillant, pour une explosion de saveurs italiennes authentiques à chaque bouchée, parfaite pour ravir petits et grands lors de vos repas en famille ou entre amis, et laisser un souvenir gourmand inoubliable, que vous pouvez également préparer à l’avance et réchauffer pour un moment chaleureux, pratique et plein de bonheur.",)
                  ],
                ),
              )),

        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottonHeightBar,
        padding: EdgeInsets.only(top: Dimensions.width30, bottom: Dimensions.width30, left: Dimensions.width20, right: Dimensions.width20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(

            topLeft: Radius.circular(Dimensions.raduis20*2),
            topRight: Radius.circular(Dimensions.raduis20*2)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.heigth20, bottom:  Dimensions.heigth20, right: Dimensions.heigth20, left: Dimensions.heigth20),
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(Dimensions.raduis20),
                color: Colors.white

              ),
             child: Row(
               children: [
                 Icon(Icons.remove, color: AppColors.signColor,),
                 SizedBox(width: Dimensions.width10/2,),
                 SizedBox(width: Dimensions.width10/2,),
                 BigText(text: "0"),
                 Icon(Icons.add , color: AppColors.signColor,)
               ],
             ),
              ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.heigth20, bottom:  Dimensions.heigth20, right: Dimensions.heigth20, left: Dimensions.heigth20),

              child: 
              BigText(text: "\$10 | Add to cart", color: Colors.white,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.raduis20),
                color: AppColors.mainColor
              ),
            )

          ],
        ),
      ),
    );
  }
}


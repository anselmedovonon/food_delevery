import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../dimensions.dart';
import '../small_text.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';
class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text ,size : Dimensions.font26),
        SizedBox(height: Dimensions.heigth10),
        // comments sections
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: 14,
                );
              }),
            ),
            SizedBox(width: 10),
            SmallText(text: "4.5"),
            SizedBox(width: 10),
            SmallText(text: "1234"),
            SizedBox(width: 10),
            SmallText(text: "Comments"),
          ],
        ),

        SizedBox(height: Dimensions.heigth20),
        // time and distance
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
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delevery/colors.dart';
import 'package:food_delevery/dimensions.dart';
import 'package:food_delevery/small_text.dart';

class ExandalbleTextWidget extends StatefulWidget {
  final String text;

  const ExandalbleTextWidget({super.key,
  required this.text});

  @override
  State<ExandalbleTextWidget> createState() => _ExandalbleTextWidgetState();
}

class _ExandalbleTextWidgetState extends State<ExandalbleTextWidget> {

  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight /5.63;

  @override
  void initState (){
    super.initState();
    if(
    widget.text.length>textHeight){
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt() +1, widget.text.length);
    } else{
      firstHalf= widget.text;
      secondHalf = "";

    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(text: firstHalf): Column(
        children: [
          SmallText(text: hiddenText?(firstHalf+"...."): (firstHalf+secondHalf),),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText =! hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(text: "Show more", color: AppColors.mainColor,),
                Icon(Icons.arrow_drop_down , color: AppColors.mainColor,)
              ],
            ),
          )
        ],
      ),
    );
  }
}

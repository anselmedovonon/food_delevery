import 'package:flutter/cupertino.dart';
import 'package:food_delevery/dimensions.dart';
import 'package:food_delevery/small_text.dart';

class IconAndTextWidget extends StatefulWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconAndTextWidget({
    super.key,
    required this.text,
    required this.iconColor,
    required this.icon
  });

  @override
  State<IconAndTextWidget> createState() => _IconAndTextWidgetState();
}

class _IconAndTextWidgetState extends State<IconAndTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(widget.icon, color: widget.iconColor, size: Dimensions.iconSize),
        SizedBox(width: 7), // Add some spacing between icon and text
        SmallText(text: widget.text)
      ],
    );
  }
}
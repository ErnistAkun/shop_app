import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/decoration/app_decoration.dart';

class YellowButtonWidget extends StatelessWidget {
  const YellowButtonWidget({
    super.key, required this.label, required this.onTap, required this.width,
  });
  final String label;
  final Function() onTap;
  final double width;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35,
        width: MediaQuery.of(context).size.width * width,
        decoration: AppDecoration.yellowContainerDecoration,
        child: Center(
          child: Text(label),
        ),
      ),
    );
  }
}

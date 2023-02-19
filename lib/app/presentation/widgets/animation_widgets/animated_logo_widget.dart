import 'dart:math';

import 'package:flutter/material.dart';

class AnimatodLogoWidget extends StatelessWidget {
  const AnimatodLogoWidget({
    super.key,
    required AnimationController controller,
  }) : _controller = controller;

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: AnimatedBuilder(
        animation: _controller.view,
        builder: (context, child) {
          return Transform.rotate(
            angle: _controller.value * 2 * pi,
            child: child,
          );
        },
        child: Image(
          image: AssetImage('images/inapp/logo.jpg'),
        ),
      ),
    );
  }
}

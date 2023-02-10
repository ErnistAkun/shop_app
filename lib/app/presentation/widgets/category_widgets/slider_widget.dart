import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/constants/text_styles/app_text_styles.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    Key? key,
    required this.mainSliderText,
  }) : super(key: key);
  final String mainSliderText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 0.05,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.grey.withOpacity(0.5),
          ),
          child: RotatedBox(
            quarterTurns: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                mainSliderText == 'beauty'
                    ? const Text('')
                    : Text(
                        '<<',
                        style: AppTextStyles.black16Bold,
                      ),
                Text(
                  mainSliderText.toUpperCase(),
                  style: AppTextStyles.black16Bold,
                ),
                mainSliderText == 'men'
                    ? const Text('')
                    : Text(
                        '>>',
                        style: AppTextStyles.black16Bold,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

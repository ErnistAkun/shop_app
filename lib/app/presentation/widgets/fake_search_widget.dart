import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/presentation/minor_screens/search_screen.dart';

class FakeSearchWidget extends StatelessWidget {
  const FakeSearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchScreen(),
          ),
        );
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: AppColors.yellow,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.0),
                  child: Icon(
                    Icons.search,
                    color: AppColors.grey,
                  ),
                ),
                Text(
                  'What are you looking for?',
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
            Container(
              height: 40.0,
              width: 100.0,
              decoration: BoxDecoration(
                color: AppColors.yellow,
                border: Border.all(
                  color: AppColors.yellow,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Center(
                child: Text(
                  'Search',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

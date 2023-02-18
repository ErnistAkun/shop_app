import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/presentation/widgets/fake_search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.white,
          title: FakeSearchWidget(),
          bottom: const TabBar(
              indicatorColor: AppColors.yellow,
              indicatorWeight: 8,
              isScrollable: true,
              tabs: [
                RepeatedTabWidget(label: 'Men'),
                RepeatedTabWidget(label: 'Women'),
                RepeatedTabWidget(label: 'Shoes'),
                RepeatedTabWidget(label: 'Bags'),
                RepeatedTabWidget(label: 'Electronics'),
                RepeatedTabWidget(label: 'Accessories'),
                RepeatedTabWidget(label: 'Home & Garden'),
                RepeatedTabWidget(label: 'Kids'),
                RepeatedTabWidget(label: 'Beauty'),
              ]),
        ),
        body: const TabBarView(children: [
          Center(child: Text('men screen')),
          Center(child: Text('women screen')),
          Center(child: Text('shoes screen')),
          Center(child: Text('bags screen')),
          Center(child: Text('electronics screen')),
          Center(child: Text('accessories screen')),
          Center(child: Text('home & garden screen')),
          Center(child: Text('kids screen')),
          Center(child: Text('beauty screen')),
        ]),
      ),
    );
  }
}

class RepeatedTabWidget extends StatelessWidget {
  final String label;
  const RepeatedTabWidget({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        label,
        style: TextStyle(color: AppColors.greyShade300),
      ),
    );
  }
}

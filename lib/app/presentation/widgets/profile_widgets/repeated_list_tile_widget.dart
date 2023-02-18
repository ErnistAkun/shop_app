import 'package:flutter/material.dart';

class RepeatedListTileWidget extends StatelessWidget {
  const RepeatedListTileWidget({
    super.key,
    required this.title,
    this.subTitle = '',
    required this.icon,
    this.onPressed,
  });
  final String title;
  final String? subTitle;
  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subTitle!),
      ),
    );
  }
}

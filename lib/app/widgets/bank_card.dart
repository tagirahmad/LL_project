import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/dimensions.dart';
import 'round_button.dart';

class BankCard extends StatelessWidget {
  const BankCard({Key? key, required this.name, required this.onTap})
      : super(key: key);

  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: false,
      color: AppColors.LIGHT_PURPLE.withOpacity(0.6),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.BORDER_RADIUS)),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.BORDER_RADIUS)),
        title: Text(
          name,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.white),
        ),
        trailing: RoundButton(
          onPressed: onTap,
          iconPath: 'assets/images/dots.svg',
          color: AppColors.LIGHT_PURPLE,
          hasBorder: true,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:l_l_app/app/constants/colors.dart';
import 'package:l_l_app/app/constants/dimensions.dart';
import 'package:l_l_app/app/widgets/round_button.dart';

class BankCard extends StatelessWidget {
  const BankCard({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: false,
      color: AppColors.LIGHT_PURPLE.withOpacity(0.6),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.BORDER_RADIUS)),
      child: ListTile(
        title: Text(
          name,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.white),
        ),
        trailing: RoundButton(
          onPressed: () {},
          iconPath: 'assets/images/dots.svg',
          color: AppColors.LIGHT_PURPLE,
          hasBorder: true,
        ),
      ),
    );
  }
}

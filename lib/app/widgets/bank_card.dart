import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/dimensions.dart';
import 'round_button.dart';

class BankCard extends StatelessWidget {
  const BankCard(
      {Key? key,
      required this.name,
      required this.onTap,
      this.day,
      this.paymentAmount})
      : super(key: key);

  final String name;
  final VoidCallback onTap;
  final String? paymentAmount;
  final String? day;

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
        subtitle: paymentAmount != null || day != null
            ? FittedBox(
                child: Row(
                  children: [
                    if (paymentAmount != null)
                      Container(
                        child: Text("${paymentAmount!}р.  /  ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: Colors.white)),
                      )
                    else
                      const SizedBox(),
                    if (day != null)
                      Container(
                        child: Text("Дата платежа ${day!} числа",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: Colors.white)),
                      )
                    else
                      const SizedBox()
                  ],
                ),
              )
            : null,
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

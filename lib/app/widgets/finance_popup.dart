import 'package:flutter/material.dart';
import 'package:l_l_app/app/constants/colors.dart';

class FinancePopup extends StatelessWidget {
  const FinancePopup(
      {Key? key,
      required this.title,
      required this.content,
      required this.backgroundColor})
      : super(key: key);
  final String title;
  final Widget content;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      content: content,
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ButtonStyle(
              overlayColor:
                  MaterialStateProperty.all<Color>(AppColors.LIGHT_BLUE)),
          child: const Text('Закрыть', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}

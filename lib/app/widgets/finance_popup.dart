import 'package:flutter/material.dart';
import '../constants/colors.dart';

class FinancePopup extends StatelessWidget {
  const FinancePopup(
      {Key? key,
      required this.title,
      required this.content,
      this.backgroundColor,
      this.actions,
      this.titleStyle})
      : super(key: key);

  final String title;
  final TextStyle? titleStyle;
  final Widget content;
  final Color? backgroundColor;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: titleStyle ?? const TextStyle(color: Colors.white),
      ),
      content: content,
      actions: actions ??
          <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all<Color>(AppColors.LIGHT_BLUE)),
              child: Text('Закрыть',
                  style: titleStyle ?? const TextStyle(color: Colors.white)),
            ),
          ],
    );
  }
}

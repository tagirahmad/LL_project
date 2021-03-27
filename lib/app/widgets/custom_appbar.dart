import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar(Key? key, this.widget)
      : preferredSize = const Size.fromHeight(150.0),
        super(key: key);
  final Widget widget;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return widget;
  }
}

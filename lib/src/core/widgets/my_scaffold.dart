import 'package:flutter/material.dart';

import '../theme/colors/app_colors.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({
    super.key,
    this.body,
    this.appBar,
    this.background,
    this.bottomNavigationBar,
  });

  final Widget? body;
  final PreferredSizeWidget? appBar;
  final Color? background;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background ?? AppColors.separatorColor,
      appBar: appBar,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

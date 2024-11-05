import 'package:flutter/material.dart';

import '../theme/colors/app_colors.dart';

showLoading(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );

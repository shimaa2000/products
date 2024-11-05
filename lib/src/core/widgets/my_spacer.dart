import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors/app_colors.dart';

class MySpacer extends StatelessWidget {
  const MySpacer({super.key,  this.height});
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height:height?? 15.h,
      margin: EdgeInsets.symmetric(vertical: 15.h),
      color: AppColors.iconBackgroundColor,
    );
  }
}

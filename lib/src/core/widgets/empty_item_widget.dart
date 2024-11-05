import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';
import '../theme/colors/app_colors.dart';
import '../theme/fonts_styles/app_font_styles.dart';

class EmptyItemWidget extends StatelessWidget {
  const EmptyItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        children: [
          const Spacer(),
          Assets.images.empty.svg(
            height: 170.h,
            width: 204.w,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'no_item_found',
            style: FontStyles.instance.p18.copyWith(
              color: AppColors.hintColor,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/src/core/widgets/cached_image.dart';
import 'package:untitled/src/features/items/domain/entities/item.dart';

import '../../../../core/theme/colors/app_colors.dart';
import '../../../../core/theme/fonts_styles/app_font_styles.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: .5,
            blurRadius: 7,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Align(
              child: CachedImage(
                link: item.imageUrl,
                fit: BoxFit.fill,
                height: 90.h,
                width: 110.h,
              ),
            ),
          ),
          Text(
            item.name,
            style: FontStyles.instance.p16.copyWith(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            item.description,
            style: FontStyles.instance.p13.copyWith(
              fontWeight: FontWeight.w300,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '\$${item.price}',
            style: FontStyles.instance.p14.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.orangeColor,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/src/core/theme/colors/app_colors.dart';
import 'package:untitled/src/features/items/presentation/cubit/item_list_cubit/items_cubit.dart';
import '../../../../core/dependency_injection.dart/dependency_injector.dart';
import '../../../../core/theme/fonts_styles/app_font_styles.dart';
import '../widgets/item_list_widget.dart';

class ItemsListScreen extends StatelessWidget {
  ItemsListScreen({Key? key}) : super(key: key);
  final itemsCubit = sl<ItemsCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: itemsCubit..getItems(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          surfaceTintColor: Colors.white,
          leading: Icon(
            Icons.menu,
            color: AppColors.primaryColor,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Products',
                style: FontStyles.instance.p28.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '10 products found',
                style: FontStyles.instance.p16.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: ItemListWidget(
                  itemsCubit: itemsCubit,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

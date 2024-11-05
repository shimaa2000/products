import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/src/core/widgets/button.dart';
import 'package:untitled/src/core/widgets/cached_image.dart';
import 'package:untitled/src/features/items/presentation/cubit/item_details_cubit/item_details_cubit.dart';

import '../../../../core/dependency_injection.dart/dependency_injector.dart';
import '../../../../core/theme/colors/app_colors.dart';
import '../../../../core/theme/fonts_styles/app_font_styles.dart';

class ItemDetailScreen extends StatelessWidget {
  final int itemId;
  static const String name = "item_details";

  ItemDetailScreen({required this.itemId});

  @override
  Widget build(BuildContext context) {
    final ItemPriceCubit = sl<ItemDetailsCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Product Details"),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      body: BlocProvider.value(
        value: ItemPriceCubit..getItemDetails(itemId),
        child: BlocBuilder<ItemDetailsCubit, ItemDetailsState>(
          builder: (context, state) {
            if (state is ItemDetailsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ItemDetailsError) {
              return Center(child: Text("Error: ${state.message}"));
            }

            return Padding(
              padding: const EdgeInsets.all(20).r,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.40,
                    width: double.infinity,
                    padding: EdgeInsets.all(50.h),
                    child: CachedImage(
                      link: (state as ItemDetailsLoaded).item.imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    state.item.name,
                    maxLines: 2,
                    style: FontStyles.instance.p22.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    state.item.description,
                    style: FontStyles.instance.p13.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "${'\$${state.item.price}'}",
                    style: FontStyles.instance.p28.copyWith(
                      color: AppColors.orangeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20).r,
        child: ButtonWidget(
          text: "Add to cart",
          onPressed: () {},
        ),
      ),
    );
  }
}

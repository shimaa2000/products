import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routes/navigation.dart';
import '../cubit/item_list_cubit/items_cubit.dart';
import '../pages/item_details_screen.dart';
import 'item_widget.dart';

class ItemListWidget extends StatelessWidget {
  ItemListWidget({super.key, required this.itemsCubit});

  final ItemsCubit itemsCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemsCubit, ItemsState>(
      builder: (context, state) {
        if (state is ItemsLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is ItemsError) {
          return Center(child: Text(state.message));
        }
        return RefreshIndicator(
          onRefresh: () async => itemsCubit.getItems(),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: itemsCubit.items.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () => CustomNavigator.instance.pushNamed(
                ItemDetailScreen.name,
                arguments: itemsCubit.items[index].id,
              ),
              child: ItemWidget(
                item: itemsCubit.items[index],
              ),
            ),
          ),
        );
      },
    );
  }
}

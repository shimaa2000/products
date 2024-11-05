import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/src/features/items/domain/usecases/get_items_usecase.dart';

import '../../../domain/entities/item.dart';

part 'items_state.dart';

@injectable
class ItemsCubit extends Cubit<ItemsState> {
  ItemsCubit(
    this._getItemsUsecase,
  ) : super(ItemsInitial());
  final GetItemsUsecase _getItemsUsecase;


  List<Item> items = [];

  void getItems() async {
    emit(ItemsLoading());

    final result = await _getItemsUsecase();

    result.fold(
      (failure) => emit(ItemsError(failure.message)),
      (items) {
        this.items = items;
        emit(ItemsLoaded(items));
      },
    );
  }
}

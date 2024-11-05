import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/item.dart';
import '../../../domain/usecases/get_item_details_usecase.dart';
import '../../../domain/usecases/get_item_price_usecase.dart';

part 'item_details_state.dart';

@injectable
class ItemDetailsCubit extends Cubit<ItemDetailsState> {
  ItemDetailsCubit(this._getItemDetailsUsecase, this._getItemPriceUsecase)
      : super(ItemDetailsInitial());
  final GetItemDetailsUsecase _getItemDetailsUsecase;
  final GetItemPriceUsecase _getItemPriceUsecase;

  void getItemDetails(int id) async {
    emit(ItemDetailsLoading());
    final result = await _getItemDetailsUsecase(id.toString());

    result.fold(
      (failure) => emit(ItemDetailsError(failure.message)),
      (item) {
        emit(ItemDetailsLoaded(item));
        watchPrice(item);
      },
    );
  }

  void watchPrice(Item item) async {
    final priceStream = await _getItemPriceUsecase(item.id.toString());
    priceStream.listen((price) {
      emit(ItemDetailsLoaded(item.copyWith(price: price)));
    }, onError: (e) {
      emit(ItemPriceError(e.toString()));
    });
  }
}

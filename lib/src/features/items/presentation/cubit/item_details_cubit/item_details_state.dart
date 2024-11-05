part of 'item_details_cubit.dart';

@immutable
abstract class ItemDetailsState extends Equatable {
  const ItemDetailsState();

  @override
  List<Object> get props => [];
}

class ItemDetailsInitial extends ItemDetailsState {}

class ItemPriceError extends ItemDetailsState {
  final String message;

  const ItemPriceError(this.message);

  @override
  List<Object> get props => [message];
}

class ItemDetailsLoading extends ItemDetailsState {}

class ItemDetailsError extends ItemDetailsState {
  final String message;

  const ItemDetailsError(this.message);

  @override
  List<Object> get props => [message];
}

class ItemDetailsLoaded extends ItemDetailsState {
  final Item item;

  const ItemDetailsLoaded(this.item);

  @override
  List<Object> get props => [item.price];
}

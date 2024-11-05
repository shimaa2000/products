part of 'items_cubit.dart';

abstract class ItemsState extends Equatable {
  const ItemsState();

  @override
  List<Object> get props => [];
}

class ItemsInitial extends ItemsState {}

class ItemsLoading extends ItemsState {}

class ItemsError extends ItemsState {
  final String message;

  const ItemsError(this.message);

  @override
  List<Object> get props => [message];
}

class ItemsLoaded extends ItemsState {
  final List<Item> items;

  const ItemsLoaded(this.items);

  @override
  List<Object> get props => [items];
}

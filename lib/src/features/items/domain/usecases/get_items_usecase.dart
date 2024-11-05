import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/src/core/exceptions/failure.dart';

import '../entities/item.dart';
import '../repositories/items_repository.dart';

@injectable
class GetItemsUsecase {
  final ItemsRepository _itemsRepository;

  GetItemsUsecase(this._itemsRepository);

  Future<Either<Failure, List<Item>>> call() async {
    return await _itemsRepository.getItems();
  }
}

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exceptions/failure.dart';
import '../entities/item.dart';
import '../repositories/items_repository.dart';

@injectable
class GetItemDetailsUsecase {
  final ItemsRepository _itemsRepository;

  GetItemDetailsUsecase(this._itemsRepository);

  Future<Either<Failure, Item>> call(String id) async {
    return await _itemsRepository.getItemDetails(id);
  }
}

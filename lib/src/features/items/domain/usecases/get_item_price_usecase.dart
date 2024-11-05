import 'package:injectable/injectable.dart';

import '../repositories/items_repository.dart';

@injectable
class GetItemPriceUsecase {
  final ItemsRepository _itemsRepository;

  GetItemPriceUsecase(this._itemsRepository);

  Stream<double?> call(String id) {
    return _itemsRepository.getItemPrice(id);
  }
}

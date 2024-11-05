import 'package:injectable/injectable.dart';
import 'package:untitled/src/core/services/network_service.dart';

import '../../models/item_model.dart';

abstract class ItemsDatasource {
  Future<List<ItemModel>> getItems();

  Future<ItemModel> getItemDetails(String id);
}

@Injectable(as: ItemsDatasource)
class ItemsDatasourceImpl implements ItemsDatasource {
  final NetworkService _networkService;

  ItemsDatasourceImpl(this._networkService);

  @override
  Future<List<ItemModel>> getItems() async {
    final response = await _networkService.get(url: 'products');

    return (response.data as List).map((e) => ItemModel.fromJson(e)).toList();
  }

  @override
  Future<ItemModel> getItemDetails(String id) async {
    final response = await _networkService.get(url: 'products/$id');

    return ItemModel.fromJson(response.data);
  }

}

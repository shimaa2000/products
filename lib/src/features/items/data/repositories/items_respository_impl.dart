import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/src/core/helpers/error_handler.dart';

import '../../../../core/exceptions/failure.dart';
import '../../domain/entities/item.dart';
import '../../domain/repositories/items_repository.dart';
import '../datasources/remote/item_firebase_datasource.dart';
import '../datasources/local/item_local_datasource.dart';
import '../datasources/remote/items_datasource.dart';

@Injectable(as: ItemsRepository)
class ItemsRepositoryImpl with errorHandler implements ItemsRepository  {
  final ItemsDatasource _itemsDatasource;
  final ItemsLocalDataSource _localDataSource;
  final ItemFirebaseDatasource _firebaseDataSource;

  ItemsRepositoryImpl(
    this._itemsDatasource,
    this._localDataSource,
    this._firebaseDataSource,
  );

  @override
  Future<Either<Failure, List<Item>>> getItems() async {
    return eitherHandler(
      () => _itemsDatasource.getItems().then(
        (items) async {
          await _localDataSource.cacheItems(items);
          return items;
        },
      ),
    );
  }

  @override
  Future<Either<Failure, Item>> getItemDetails(String id) async {
    return eitherHandler(() => _itemsDatasource.getItemDetails(id));
  }

  @override
  Stream<double?> getItemPrice(String id) {
    return streamHandler(
      () => _firebaseDataSource.watchItemPrice(id),
    );
  }
}

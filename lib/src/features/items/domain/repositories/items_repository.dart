import 'package:dartz/dartz.dart';
import 'package:untitled/src/core/exceptions/failure.dart';

import '../entities/item.dart';

abstract class ItemsRepository {
  Future<Either<Failure, List<Item>>> getItems();

  Future<Either<Failure, Item>> getItemDetails(String id);

  Stream<double?> getItemPrice(String id);
}

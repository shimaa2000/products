import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

abstract class ItemFirebaseDatasource {
  Stream<double?> watchItemPrice(String productId);
}

@Injectable(as: ItemFirebaseDatasource)
class ItemFirebaseDataSourceImpl implements ItemFirebaseDatasource {
  final _database = FirebaseFirestore.instance;

  @override
  Stream<double?> watchItemPrice(String productId) {
    return _database.collection('products').doc(productId).snapshots().map((
        event) => event.data()?['price'].toDouble(),);
  }

}

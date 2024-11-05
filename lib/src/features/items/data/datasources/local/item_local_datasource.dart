import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../models/item_model.dart';

abstract class ItemsLocalDataSource {
  Future<void> cacheItems(List<ItemModel> items);

  Future<List<ItemModel>> getCachedItems();
}

@Injectable(as: ItemsLocalDataSource)
class ItemLocalDataSourceImpl implements ItemsLocalDataSource {
  late Database _db;
  ItemLocalDataSourceImpl() {
    init();
  }


  Future<void> init() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), 'items.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE items(id TEXT PRIMARY KEY, name TEXT, description TEXT, imageUrl TEXT, price REAL)",
        );
      },
      version: 1,
    );
  }

  @override
  Future<void> cacheItems(List<ItemModel> items) async {
    for (var item in items) {
      await _db.insert(
        'items',
        item.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  @override
  Future<List<ItemModel>> getCachedItems() async {
    final List<Map<String, dynamic>> maps = await _db.query('items');
    return List.generate(maps.length, (i) => ItemModel.fromJson(maps[i]));
  }
}

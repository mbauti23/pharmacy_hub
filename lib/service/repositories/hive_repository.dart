import 'package:hive/hive.dart';

class HiveRepository {
  HiveRepository(this.boxName);
  final String boxName;
  Box<dynamic>? box;

  Future<void> init() async {
    box ??= await Hive.openBox(boxName);
  }

  Future<void> put(String key, dynamic val) async {
    await init();
    await box!.put(key, val);
  }

  Future<dynamic> get(String key, dynamic val) async {
    await init();
    return box!.get(key);
  }

  Future<List<dynamic>> getAll() async {
    await init();
    return box!.values.toList();
  }

  Future<void> clear() async {
    await init();
    await box!.clear();
  }

  Future<void> close() async {
    if (box != null) {
      await box!.close();
    }
  }
}

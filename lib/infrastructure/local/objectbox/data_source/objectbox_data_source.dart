import 'package:injectable/injectable.dart';

import 'package:flutter_local_storages/objectbox.g.dart';
import 'package:flutter_local_storages/domain/character/character.dart';
import 'package:flutter_local_storages/domain/objectbox/objbox_char.dart';

abstract class IObjectboxDataSource {
  Future<List<ObjChar>> getObjectboxCharacters();
  Future<void> saveObjectboxCharacters(List<Character> characters);
  Future<void> cleanData();
}

@LazySingleton(as: IObjectboxDataSource)
class ObjectboxDataSource implements IObjectboxDataSource {
  final Store _store;

  const ObjectboxDataSource(this._store);

  @override
  Future<List<ObjChar>> getObjectboxCharacters() async {
    final box = _store.box<ObjChar>();
    return await box.getAllAsync();
  }

  @override
  Future<void> saveObjectboxCharacters(List<Character> characters) async {
    final box = _store.box<ObjChar>();
    await box.removeAllAsync();
    await box.putManyAsync([...characters.map((e) => ObjChar.fromBase(e))]);
  }

  @override
  Future<void> cleanData() async {
    final box = _store.box<ObjChar>();
    await box.removeAllAsync();
  }
}

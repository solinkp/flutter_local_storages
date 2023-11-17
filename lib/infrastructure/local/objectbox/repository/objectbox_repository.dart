import 'package:injectable/injectable.dart';

import 'package:flutter_local_storages/domain/character/character.dart';
import 'package:flutter_local_storages/domain/objectbox/objbox_char.dart';
import 'package:flutter_local_storages/infrastructure/local/objectbox/data_source/objectbox_data_source.dart';

abstract class IObjectboxRepository {
  Future<List<Character>> getObjectboxCharacters();
  Future<void> saveObjectboxCharacters(List<Character> characters);
  Future<void> cleanData();
}

@LazySingleton(as: IObjectboxRepository)
class ObjectboxRepository implements IObjectboxRepository {
  final IObjectboxDataSource _dataSource;

  const ObjectboxRepository(this._dataSource);

  @override
  Future<List<Character>> getObjectboxCharacters() async {
    var characters = <Character>[];
    var objectboxChars = await _dataSource.getObjectboxCharacters();
    if (objectboxChars.isNotEmpty) {
      characters.addAll(objectboxChars.map((e) => e.toBase()));
    }
    return characters;
  }

  @override
  Future<void> saveObjectboxCharacters(List<Character> characters) async {
    await _dataSource.saveObjectboxCharacters(characters);
  }

  @override
  Future<void> cleanData() async => await _dataSource.cleanData();
}

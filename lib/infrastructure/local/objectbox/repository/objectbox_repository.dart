import 'package:injectable/injectable.dart';

import 'package:flutter_local_storages/domain/character/character.dart';
import 'package:flutter_local_storages/domain/objectbox/objbox_char.dart';
import 'package:flutter_local_storages/infrastructure/local/objectbox/data_source/objectbox_data_source.dart';

abstract class IObjectboxRepository {
  Future<List<ObjChar>> getObjectboxCharacters();
  Future<void> saveObjectboxCharacters(List<Character> characters);
}

@LazySingleton(as: IObjectboxRepository)
class ObjectboxRepository implements IObjectboxRepository {
  final IObjectboxDataSource _dataSource;

  const ObjectboxRepository(this._dataSource);

  @override
  Future<List<ObjChar>> getObjectboxCharacters() async {
    return await _dataSource.getObjectboxCharacters();
  }

  @override
  Future<void> saveObjectboxCharacters(List<Character> characters) async {
    await _dataSource.saveObjectboxCharacters(characters);
  }
}

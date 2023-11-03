import 'package:injectable/injectable.dart';

import 'package:flutter_local_storages/domain/hive/hive_char.dart';
import 'package:flutter_local_storages/domain/character/character.dart';
import 'package:flutter_local_storages/infrastructure/local/hive/data_source/hive_data_source.dart';

abstract class IHiveRepository {
  Future<List<HiveChar>> getHiveCharacters();
  Future<void> saveHiveCharacters(List<Character> characters);
}

@LazySingleton(as: IHiveRepository)
class HiveRepository implements IHiveRepository {
  final IHiveDataSource _dataSource;

  const HiveRepository(this._dataSource);

  @override
  Future<List<HiveChar>> getHiveCharacters() async {
    return await _dataSource.getHiveCharacters();
  }

  @override
  Future<void> saveHiveCharacters(List<Character> characters) async {
    await _dataSource.saveHiveCharacters(characters);
  }
}

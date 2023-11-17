import 'package:injectable/injectable.dart';

import 'package:flutter_local_storages/domain/hive/hive_char.dart';
import 'package:flutter_local_storages/domain/character/character.dart';
import 'package:flutter_local_storages/infrastructure/local/hive/data_source/hive_data_source.dart';

abstract class IHiveRepository {
  Future<List<Character>> getHiveCharacters();
  Future<void> saveHiveCharacters(List<Character> characters);
  Future<void> cleanData();
}

@LazySingleton(as: IHiveRepository)
class HiveRepository implements IHiveRepository {
  final IHiveDataSource _dataSource;

  const HiveRepository(this._dataSource);

  @override
  Future<List<Character>> getHiveCharacters() async {
    var characters = <Character>[];
    var hiveChars = await _dataSource.getHiveCharacters();
    if (hiveChars.isNotEmpty) {
      characters.addAll(hiveChars.map((e) => e.toBase()));
    }
    return characters;
  }

  @override
  Future<void> saveHiveCharacters(List<Character> characters) async {
    await _dataSource.saveHiveCharacters(characters);
  }

  @override
  Future<void> cleanData() async => await _dataSource.cleanData();
}

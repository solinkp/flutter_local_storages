import 'package:injectable/injectable.dart';

import 'package:flutter_local_storages/domain/character/character.dart';
import 'package:flutter_local_storages/infrastructure/local/sembast/data_source/sembast_data_source.dart';

abstract class ISembastRepository {
  Future<List<Character>> getSembastCharacters();
  Future<void> saveSembastCharacters(List<Character> characters);
  Future<void> cleanData();
}

@LazySingleton(as: ISembastRepository)
class SembastRepository implements ISembastRepository {
  final ISembastDataSource _dataSource;

  const SembastRepository(this._dataSource);

  @override
  Future<List<Character>> getSembastCharacters() async {
    var characters = <Character>[];
    var sembastChars = await _dataSource.getSembastCharacters();
    if (sembastChars.isNotEmpty) {
      characters.addAll(sembastChars.map((e) => Character.fromStoredJson(e)));
    }
    return characters;
  }

  @override
  Future<void> saveSembastCharacters(List<Character> characters) async {
    await _dataSource.saveSembastCharacters(characters);
  }

  @override
  Future<void> cleanData() async => await _dataSource.cleanData();
}

import 'package:injectable/injectable.dart';

import 'package:flutter_local_storages/domain/character/character.dart';
import 'package:flutter_local_storages/infrastructure/local/cbl/data_source/cbl_data_source.dart';

abstract class ICblRepository {
  Future<List<Character>> getCblCharacters();
  Future<void> saveCblCharacters(List<Character> characters);
  Future<void> cleanData();
}

@LazySingleton(as: ICblRepository)
class CblRepository implements ICblRepository {
  final ICblDataSource _dataSource;

  const CblRepository(this._dataSource);

  @override
  Future<List<Character>> getCblCharacters() async {
    var characters = <Character>[];
    var cblChars = await _dataSource.getCblCharacters();
    if (cblChars.isNotEmpty) {
      characters.addAll(cblChars.map((e) => Character.fromStoredJson(e)));
    }
    return characters;
  }

  @override
  Future<void> saveCblCharacters(List<Character> characters) async {
    await _dataSource.saveCblCharacters(characters);
  }

  @override
  Future<void> cleanData() async => await _dataSource.cleanData();
}

import 'package:injectable/injectable.dart';

import 'package:flutter_local_storages/domain/character/character.dart';
import 'package:flutter_local_storages/infrastructure/local/cbl/data_source/cbl_data_source.dart';

abstract class ICblRepository {
  Future<List<Character>> getCblCharacters();
  Future<void> saveCblCharacters(List<Character> characters);
  Future<void> cleanData();
}

@LazySingleton(as: ICblRepository)
class SembastRepository implements ICblRepository {
  final ICblDataSource _dataSource;

  const SembastRepository(this._dataSource);

  @override
  Future<List<Character>> getCblCharacters() async {
    return await _dataSource.getCblCharacters();
  }

  @override
  Future<void> saveCblCharacters(List<Character> characters) async {
    await _dataSource.saveCblCharacters(characters);
  }

  @override
  Future<void> cleanData() async => await _dataSource.cleanData();
}

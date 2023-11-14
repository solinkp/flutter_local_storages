import 'package:injectable/injectable.dart';

import 'package:flutter_local_storages/domain/character/character.dart';
import 'package:flutter_local_storages/infrastructure/local/sqflite/data_source/sqflite_data_source.dart';

abstract class ISqfLiteRepository {
  Future<List<Character>> getSQFLiteCharacters();
  Future<void> saveSQFLiteCharacters(List<Character> characters);
  Future<void> cleanData();
}

@LazySingleton(as: ISqfLiteRepository)
class SqfLiteRepository implements ISqfLiteRepository {
  final ISqfLiteDataSource _dataSource;

  const SqfLiteRepository(this._dataSource);

  @override
  Future<List<Character>> getSQFLiteCharacters() async {
    return await _dataSource.getSQFLiteCharacters();
  }

  @override
  Future<void> saveSQFLiteCharacters(List<Character> characters) async {
    await _dataSource.saveSQFLiteCharacters(characters);
  }

  @override
  Future<void> cleanData() async => await _dataSource.cleanData();
}

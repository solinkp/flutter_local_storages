import 'package:injectable/injectable.dart';

import 'package:flutter_local_storages/domain/isar/isar_char.dart';
import 'package:flutter_local_storages/domain/character/character.dart';
import 'package:flutter_local_storages/infrastructure/local/isar/data_source/isar_data_source.dart';

abstract class IIsarRepository {
  Future<List<IsarChar>> getIsarCharacters();
  Future<void> saveIsarCharacters(List<Character> characters);
}

@LazySingleton(as: IIsarRepository)
class IsarRepository implements IIsarRepository {
  final IIsarDataSource _dataSource;

  const IsarRepository(this._dataSource);

  @override
  Future<List<IsarChar>> getIsarCharacters() async {
    return await _dataSource.getIsarCharacters();
  }

  @override
  Future<void> saveIsarCharacters(List<Character> characters) async {
    await _dataSource.saveIsarCharacters(characters);
  }
}

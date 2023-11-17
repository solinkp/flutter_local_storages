import 'package:injectable/injectable.dart';

import 'package:flutter_local_storages/domain/isar/isar_char.dart';
import 'package:flutter_local_storages/domain/character/character.dart';
import 'package:flutter_local_storages/infrastructure/local/isar/data_source/isar_data_source.dart';

abstract class IIsarRepository {
  Future<List<Character>> getIsarCharacters();
  Future<void> saveIsarCharacters(List<Character> characters);
  Future<void> cleanData();
}

@LazySingleton(as: IIsarRepository)
class IsarRepository implements IIsarRepository {
  final IIsarDataSource _dataSource;

  const IsarRepository(this._dataSource);

  @override
  Future<List<Character>> getIsarCharacters() async {
    var characters = <Character>[];
    var isarChars = await _dataSource.getIsarCharacters();
    if (isarChars.isNotEmpty) {
      characters.addAll(isarChars.map((e) => e.toBase()));
    }
    return characters;
  }

  @override
  Future<void> saveIsarCharacters(List<Character> characters) async {
    await _dataSource.saveIsarCharacters(characters);
  }

  @override
  Future<void> cleanData() async => await _dataSource.cleanData();
}

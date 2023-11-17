import 'package:isar/isar.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_local_storages/domain/isar/isar_char.dart';
import 'package:flutter_local_storages/domain/character/character.dart';

abstract class IIsarDataSource {
  Future<List<IsarChar>> getIsarCharacters();
  Future<void> saveIsarCharacters(List<Character> characters);
  Future<void> cleanData();
}

@LazySingleton(as: IIsarDataSource)
class IsarDataSource implements IIsarDataSource {
  final Isar _isar;

  const IsarDataSource(this._isar);

  @override
  Future<List<IsarChar>> getIsarCharacters() async {
    return await _isar.isarChars.where().findAll();
  }

  @override
  Future<void> saveIsarCharacters(List<Character> characters) async {
    await cleanData();
    await _isar.writeTxn(() async {
      for (var char in characters) {
        await _isar.isarChars.put(IsarChar.fromBase(char));
      }
    });
  }

  @override
  Future<void> cleanData() async {
    await _isar.writeTxn(() async {
      await _isar.isarChars.where().deleteAll();
    });
  }
}

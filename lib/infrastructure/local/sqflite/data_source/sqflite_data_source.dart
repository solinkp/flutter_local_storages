import 'package:sqflite/sqflite.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_local_storages/domain/character/character.dart';

abstract class ISqfLiteDataSource {
  Future<List<Map<String, dynamic>>> getSQFLiteCharacters();
  Future<void> saveSQFLiteCharacters(List<Character> characters);
  Future<void> cleanData();
}

@LazySingleton(as: ISqfLiteDataSource)
class SqfLiteDataSource implements ISqfLiteDataSource {
  final Database _sqfliteDB;

  const SqfLiteDataSource(this._sqfliteDB);

  @override
  Future<List<Map<String, dynamic>>> getSQFLiteCharacters() async {
    List<Map<String, dynamic>> list = await _sqfliteDB.query('Character');
    // List<Map<String, dynamic>> list = await _sqfliteDB.rawQuery(
    //   'SELECT * FROM Character',
    // );
    return list;
  }

  @override
  Future<void> saveSQFLiteCharacters(List<Character> characters) async {
    cleanData();
    await _sqfliteDB.transaction((txn) async {
      for (var character in characters) {
        await txn.insert('Character', character.toJson());
        // await txn.rawInsert(
        //   'INSERT INTO Character(id, name, status, species, type, gender, image, origin) VALUES(?,?,?,?,?,?,?,?)',
        //   [
        //     character.id,
        //     character.name,
        //     character.status.statusVal,
        //     character.species,
        //     character.type,
        //     character.gender.genderVal,
        //     character.image,
        //     character.origin,
        //   ],
        // );
      }
    });
  }

  @override
  Future<void> cleanData() async {
    await _sqfliteDB.delete('Character');
    // _sqfliteDB.rawDelete('DELETE FROM Character');
  }
}

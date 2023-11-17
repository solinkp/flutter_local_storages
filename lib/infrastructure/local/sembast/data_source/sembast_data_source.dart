import 'package:sembast/sembast.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_local_storages/domain/character/character.dart';

abstract class ISembastDataSource {
  Future<List<Map<String, dynamic>>> getSembastCharacters();
  Future<void> saveSembastCharacters(List<Character> characters);
  Future<void> cleanData();
}

@LazySingleton(as: ISembastDataSource)
class SembastDataSource implements ISembastDataSource {
  final Database _sembastDB;
  final StoreRef _sembCharacterStore;

  const SembastDataSource(this._sembastDB, this._sembCharacterStore);

  @override
  Future<List<Map<String, dynamic>>> getSembastCharacters() async {
    final snapshots = await _sembCharacterStore.find(_sembastDB);
    return snapshots.map((e) => e.value as Map<String, dynamic>).toList();
  }

  @override
  Future<void> saveSembastCharacters(List<Character> characters) async {
    cleanData();
    await _sembCharacterStore.addAll(
      _sembastDB,
      characters.map((e) => e.toJson()).toList(),
    );
  }

  @override
  Future<void> cleanData() async => await _sembCharacterStore.delete(_sembastDB);
}

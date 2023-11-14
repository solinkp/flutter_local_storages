import 'package:injectable/injectable.dart';

import 'package:flutter_local_storages/core/database/drift_db.dart';
import 'package:flutter_local_storages/domain/character/character.dart';

abstract class IDriftDataSource {
  Future<List<DriftCharData>> getDriftCharacters();
  Future<void> saveDriftCharacters(List<Character> characters);
  Future<void> cleanData();
}

@LazySingleton(as: IDriftDataSource)
class DriftDataSource implements IDriftDataSource {
  final DriftDB _driftDb;

  const DriftDataSource(this._driftDb);

  @override
  Future<List<DriftCharData>> getDriftCharacters() async {
    return await _driftDb.select(_driftDb.driftChar).get();
  }

  @override
  Future<void> saveDriftCharacters(List<Character> characters) async {
    cleanData();
    for (var character in characters) {
      await _driftDb.into(_driftDb.driftChar).insert(DriftCharCompanion.insert(
            id: character.id,
            name: character.name,
            status: character.status.statusVal,
            species: character.species,
            type: character.type,
            gender: character.gender.genderVal,
            image: character.image,
            origin: character.origin,
          ));
    }
  }

  @override
  Future<void> cleanData() async => _driftDb.delete(_driftDb.driftChar).go();
}

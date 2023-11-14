import 'package:injectable/injectable.dart';

import 'package:flutter_local_storages/core/database/drift_db.dart';
import 'package:flutter_local_storages/domain/character/character.dart';
import 'package:flutter_local_storages/infrastructure/local/drift/data_source/drift_data_source.dart';

abstract class IDriftRepository {
  Future<List<DriftCharData>> getDriftCharacters();
  Future<void> saveDriftCharacters(List<Character> characters);
  Future<void> cleanData();
}

@LazySingleton(as: IDriftRepository)
class DriftRepository implements IDriftRepository {
  final IDriftDataSource _dataSource;

  const DriftRepository(this._dataSource);

  @override
  Future<List<DriftCharData>> getDriftCharacters() async {
    return await _dataSource.getDriftCharacters();
  }

  @override
  Future<void> saveDriftCharacters(List<Character> characters) async {
    await _dataSource.saveDriftCharacters(characters);
  }

  @override
  Future<void> cleanData() async => await _dataSource.cleanData();
}

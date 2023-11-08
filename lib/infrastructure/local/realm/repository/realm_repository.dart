import 'package:injectable/injectable.dart';

import 'package:flutter_local_storages/domain/realm/realm_char.dart';
import 'package:flutter_local_storages/domain/character/character.dart';
import 'package:flutter_local_storages/infrastructure/local/realm/data_source/realm_data_source.dart';

abstract class IRealmRepository {
  Future<List<RealmChar>> getRealmCharacters();
  Future<void> saveRealmCharacters(List<Character> characters);
  Future<void> cleanData();
}

@LazySingleton(as: IRealmRepository)
class RealmRepository implements IRealmRepository {
  final IRealmDataSource _dataSource;

  const RealmRepository(this._dataSource);

  @override
  Future<List<RealmChar>> getRealmCharacters() async {
    return await _dataSource.getRealmCharacters();
  }

  @override
  Future<void> saveRealmCharacters(List<Character> characters) async {
    await _dataSource.saveRealmCharacters(characters);
  }

  @override
  Future<void> cleanData() async => await _dataSource.cleanData();
}

import 'package:realm/realm.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_local_storages/domain/realm/realm_char.dart';
import 'package:flutter_local_storages/domain/character/character.dart';

abstract class IRealmDataSource {
  Future<List<RealmChar>> getRealmCharacters();
  Future<void> saveRealmCharacters(List<Character> characters);
  Future<void> cleanData();
}

@LazySingleton(as: IRealmDataSource)
class RealmDataSource implements IRealmDataSource {
  final Realm _realm;

  const RealmDataSource(this._realm);

  @override
  Future<List<RealmChar>> getRealmCharacters() async {
    return _realm.all<RealmChar>().toList();
  }

  @override
  Future<void> saveRealmCharacters(List<Character> characters) async {
    await cleanData();
    await _realm.writeAsync(() async {
      for (var character in characters) {
        var realmChar = RealmChar(
          character.id,
          character.name,
          character.species,
          character.type,
          character.image,
          character.origin,
          character.status.statusVal,
          character.gender.genderVal,
        );
        _realm.add(realmChar);
      }
    });
  }

  @override
  Future<void> cleanData() async {
    await _realm.writeAsync(() => _realm.deleteAll<RealmChar>());
  }
}

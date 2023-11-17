import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_local_storages/di/injection.dart';
import 'package:flutter_local_storages/domain/character/character.dart';
import 'package:flutter_local_storages/infrastructure/remote/repository/character_repository.dart';
import 'package:flutter_local_storages/infrastructure/local/realm/repository/realm_repository.dart';

part 'realm_provider.g.dart';

@riverpod
class RealmChars extends _$RealmChars {
  final characters = <Character>[];

  @override
  Future<List<Character>> build() async => await _getLocalData();

  Future<List<Character>> _getLocalData() async {
    characters.clear();
    return await locator<IRealmRepository>().getRealmCharacters();
  }

  Future<void> syncRemote() async {
    state = const AsyncLoading();
    var remoteChars = await locator<ICharacterRepository>().getCharacters();
    await locator<IRealmRepository>().saveRealmCharacters(remoteChars);

    state = AsyncValue.data(await _getLocalData());
  }

  Future<void> cleanData() async {
    state = const AsyncLoading();
    await locator<IRealmRepository>().cleanData();
    state = AsyncValue.data(await _getLocalData());
  }
}

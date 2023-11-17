import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_local_storages/di/injection.dart';
import 'package:flutter_local_storages/domain/character/character.dart';
import 'package:flutter_local_storages/infrastructure/remote/repository/character_repository.dart';
import 'package:flutter_local_storages/infrastructure/local/objectbox/repository/objectbox_repository.dart';

part 'objectbox_provider.g.dart';

@riverpod
class ObjboxChars extends _$ObjboxChars {
  final characters = <Character>[];

  @override
  Future<List<Character>> build() async => await _getLocalData();

  Future<List<Character>> _getLocalData() async {
    characters.clear();
    return await locator<IObjectboxRepository>().getObjectboxCharacters();
  }

  Future<void> syncRemote() async {
    state = const AsyncLoading();
    var remoteChars = await locator<ICharacterRepository>().getCharacters();
    await locator<IObjectboxRepository>().saveObjectboxCharacters(remoteChars);

    state = AsyncValue.data(await _getLocalData());
  }

  Future<void> cleanData() async {
    state = const AsyncLoading();
    await locator<IObjectboxRepository>().cleanData();
    state = AsyncValue.data(await _getLocalData());
  }
}

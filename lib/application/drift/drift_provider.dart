import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_local_storages/di/injection.dart';
import 'package:flutter_local_storages/domain/character/character.dart';
import 'package:flutter_local_storages/infrastructure/remote/repository/character_repository.dart';
import 'package:flutter_local_storages/infrastructure/local/drift/repository/drift_repository.dart';

part 'drift_provider.g.dart';

@riverpod
class DriftChars extends _$DriftChars {
  final characters = <Character>[];

  @override
  Future<List<Character>> build() async => await _getLocalData();

  Future<List<Character>> _getLocalData() async {
    characters.clear();
    var driftChars = await locator<IDriftRepository>().getDriftCharacters();

    if (driftChars.isNotEmpty) {
      for (var driftChar in driftChars) {
        characters.add(Character.fromStoredJson(driftChar.toJson()));
      }
    }
    return characters;
  }

  Future<void> syncRemote() async {
    state = const AsyncLoading();
    var remoteChars = await locator<ICharacterRepository>().getCharacters();
    await locator<IDriftRepository>().saveDriftCharacters(remoteChars);

    state = AsyncValue.data(await _getLocalData());
  }

  Future<void> cleanData() async {
    state = const AsyncLoading();
    await locator<IDriftRepository>().cleanData();
    state = AsyncValue.data(await _getLocalData());
  }
}

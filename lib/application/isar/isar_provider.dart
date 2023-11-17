import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_local_storages/di/injection.dart';
import 'package:flutter_local_storages/domain/character/character.dart';
import 'package:flutter_local_storages/infrastructure/local/isar/repository/isar_repository.dart';
import 'package:flutter_local_storages/infrastructure/remote/repository/character_repository.dart';

part 'isar_provider.g.dart';

@riverpod
class IsarChars extends _$IsarChars {
  final characters = <Character>[];

  @override
  Future<List<Character>> build() async => await _getLocalData();

  Future<List<Character>> _getLocalData() async {
    characters.clear();
    return await locator<IIsarRepository>().getIsarCharacters();
  }

  Future<void> syncRemote() async {
    state = const AsyncLoading();
    var remoteChars = await locator<ICharacterRepository>().getCharacters();
    await locator<IIsarRepository>().saveIsarCharacters(remoteChars);

    state = AsyncValue.data(await _getLocalData());
  }

  Future<void> cleanData() async {
    state = const AsyncLoading();
    await locator<IIsarRepository>().cleanData();
    state = AsyncValue.data(await _getLocalData());
  }
}

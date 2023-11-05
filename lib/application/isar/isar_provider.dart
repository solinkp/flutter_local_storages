import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_local_storages/di/injection.dart';
import 'package:flutter_local_storages/domain/isar/isar_char.dart';
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
    var isarChars = await locator<IIsarRepository>().getIsarCharacters();

    if (isarChars.isNotEmpty) {
      for (var isarChar in isarChars) {
        characters.add(isarChar.toBase());
      }
    }
    return characters;
  }

  Future<void> syncRemote() async {
    state = const AsyncLoading();
    var remoteChars = await locator<ICharacterRepository>().getCharacters();
    await locator<IIsarRepository>().saveIsarCharacters(remoteChars);

    state = AsyncValue.data(await _getLocalData());
  }
}

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_local_storages/di/injection.dart';
import 'package:flutter_local_storages/domain/character/character.dart';
import 'package:flutter_local_storages/infrastructure/remote/repository/character_repository.dart';
import 'package:flutter_local_storages/infrastructure/local/sqflite/repository/sqflite_repository.dart';

part 'sqflite_provider.g.dart';

@riverpod
class SqfLiteChars extends _$SqfLiteChars {
  final characters = <Character>[];

  @override
  Future<List<Character>> build() async => await _getLocalData();

  Future<List<Character>> _getLocalData() async {
    characters.clear();
    return await locator<ISqfLiteRepository>().getSQFLiteCharacters();
  }

  Future<void> syncRemote() async {
    state = const AsyncLoading();
    var remoteChars = await locator<ICharacterRepository>().getCharacters();
    await locator<ISqfLiteRepository>().saveSQFLiteCharacters(remoteChars);

    state = AsyncValue.data(await _getLocalData());
  }

  Future<void> cleanData() async {
    state = const AsyncLoading();
    await locator<ISqfLiteRepository>().cleanData();
    state = AsyncValue.data(await _getLocalData());
  }
}

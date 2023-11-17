import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_local_storages/di/injection.dart';
import 'package:flutter_local_storages/domain/character/character.dart';
import 'package:flutter_local_storages/infrastructure/local/hive/repository/hive_repository.dart';
import 'package:flutter_local_storages/infrastructure/remote/repository/character_repository.dart';

part 'hive_provider.g.dart';

@riverpod
class HiveChars extends _$HiveChars {
  final characters = <Character>[];

  @override
  Future<List<Character>> build() async => await _getLocalData();

  Future<List<Character>> _getLocalData() async {
    characters.clear();
    return await locator<IHiveRepository>().getHiveCharacters();
  }

  Future<void> syncRemote() async {
    state = const AsyncLoading();
    var remoteChars = await locator<ICharacterRepository>().getCharacters();
    await locator<IHiveRepository>().saveHiveCharacters(remoteChars);

    state = AsyncValue.data(await _getLocalData());
  }

  Future<void> cleanData() async {
    state = const AsyncLoading();
    await locator<IHiveRepository>().cleanData();
    state = AsyncValue.data(await _getLocalData());
  }
}

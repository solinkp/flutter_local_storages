import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_local_storages/di/injection.dart';
import 'package:flutter_local_storages/domain/hive/hive_char.dart';
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
    var hiveChars = await locator<IHiveRepository>().getHiveCharacters();

    if (hiveChars.isNotEmpty) {
      for (var hiveChar in hiveChars) {
        characters.add(hiveChar.toBase());
      }
    }
    return characters;
  }

  Future<void> syncRemote() async {
    state = const AsyncData([]);
    var remoteChars = await locator<ICharacterRepository>().getCharacters();
    await locator<IHiveRepository>().saveHiveCharacters(remoteChars);

    state = AsyncValue.data(await _getLocalData());
  }
}

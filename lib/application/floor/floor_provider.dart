import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_local_storages/di/injection.dart';
import 'package:flutter_local_storages/domain/floor/floor_char.dart';
import 'package:flutter_local_storages/domain/character/character.dart';
import 'package:flutter_local_storages/infrastructure/remote/repository/character_repository.dart';
import 'package:flutter_local_storages/infrastructure/local/floor/repository/floor_repository.dart';

part 'floor_provider.g.dart';

@riverpod
class FloorChars extends _$FloorChars {
  final characters = <Character>[];

  @override
  Future<List<Character>> build() async => await _getLocalData();

  Future<List<Character>> _getLocalData() async {
    characters.clear();
    var floorChars = await locator<IFloorRepository>().getFloorCharacters();

    if (floorChars.isNotEmpty) {
      for (var floorChar in floorChars) {
        characters.add(floorChar.toBase());
      }
    }
    return characters;
  }

  Future<void> syncRemote() async {
    state = const AsyncLoading();
    var remoteChars = await locator<ICharacterRepository>().getCharacters();
    await locator<IFloorRepository>().saveFloorCharacters(remoteChars);

    state = AsyncValue.data(await _getLocalData());
  }

  Future<void> cleanData() async {
    state = const AsyncLoading();
    await locator<IFloorRepository>().cleanData();
    state = AsyncValue.data(await _getLocalData());
  }
}

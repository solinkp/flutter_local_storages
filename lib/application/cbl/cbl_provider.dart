import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_local_storages/di/injection.dart';
import 'package:flutter_local_storages/domain/character/character.dart';
import 'package:flutter_local_storages/infrastructure/local/cbl/repository/cbl_repository.dart';
import 'package:flutter_local_storages/infrastructure/remote/repository/character_repository.dart';

part 'cbl_provider.g.dart';

@riverpod
class CblChars extends _$CblChars {
  final characters = <Character>[];

  @override
  Future<List<Character>> build() async => await _getLocalData();

  Future<List<Character>> _getLocalData() async {
    characters.clear();
    return await locator<ICblRepository>().getCblCharacters();
  }

  Future<void> syncRemote() async {
    state = const AsyncLoading();
    var remoteChars = await locator<ICharacterRepository>().getCharacters();
    await locator<ICblRepository>().saveCblCharacters(remoteChars);

    state = AsyncValue.data(await _getLocalData());
  }

  Future<void> cleanData() async {
    state = const AsyncLoading();
    await locator<ICblRepository>().cleanData();
    state = AsyncValue.data(await _getLocalData());
  }
}

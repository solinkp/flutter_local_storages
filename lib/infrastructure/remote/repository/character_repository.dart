import 'package:injectable/injectable.dart';

import 'package:flutter_local_storages/domain/character/character.dart';
import 'package:flutter_local_storages/infrastructure/remote/data_source/character_data_source.dart';

abstract class ICharacterRepository {
  Future<List<Character>> getCharacters();
}

@LazySingleton(as: ICharacterRepository)
class CharacterRepository implements ICharacterRepository {
  final ICharacterDataSource _dataSource;

  const CharacterRepository(this._dataSource);

  @override
  Future<List<Character>> getCharacters() async {
    return await _dataSource.getCharacters();
  }
}

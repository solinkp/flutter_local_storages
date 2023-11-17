import 'package:injectable/injectable.dart';

import 'package:flutter_local_storages/domain/floor/floor_char.dart';
import 'package:flutter_local_storages/domain/character/character.dart';
import 'package:flutter_local_storages/infrastructure/local/floor/data_source/floor_data_source.dart';

abstract class IFloorRepository {
  Future<List<Character>> getFloorCharacters();
  Future<void> saveFloorCharacters(List<Character> characters);
  Future<void> cleanData();
}

@LazySingleton(as: IFloorRepository)
class FloorRepository implements IFloorRepository {
  final IFloorDataSource _dataSource;

  const FloorRepository(this._dataSource);

  @override
  Future<List<Character>> getFloorCharacters() async {
    var characters = <Character>[];
    var floorChars = await _dataSource.getFloorCharacters();
    if (floorChars.isNotEmpty) {
      characters.addAll(floorChars.map((e) => e.toBase()));
    }
    return characters;
  }

  @override
  Future<void> saveFloorCharacters(List<Character> characters) async {
    await _dataSource.saveFloorCharacters(characters);
  }

  @override
  Future<void> cleanData() async => await _dataSource.cleanData();
}

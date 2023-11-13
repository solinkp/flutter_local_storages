import 'package:injectable/injectable.dart';

import 'package:flutter_local_storages/core/database/floor_db.dart';
import 'package:flutter_local_storages/domain/floor/floor_char.dart';
import 'package:flutter_local_storages/domain/character/character.dart';

abstract class IFloorDataSource {
  Future<List<FloorChar>> getFloorCharacters();
  Future<void> saveFloorCharacters(List<Character> characters);
  Future<void> cleanData();
}

@LazySingleton(as: IFloorDataSource)
class FloorDataSource implements IFloorDataSource {
  final AppDB _floorDb;

  const FloorDataSource(this._floorDb);

  @override
  Future<List<FloorChar>> getFloorCharacters() async {
    return await _floorDb.floorCharDao.findAllCharacters();
  }

  @override
  Future<void> saveFloorCharacters(List<Character> characters) async {
    cleanData();
    for (var character in characters) {
      await _floorDb.floorCharDao.insertCharacter(FloorChar.fromBase(character));
    }
  }

  @override
  Future<void> cleanData() async => _floorDb.floorCharDao.deleteCharacters();
}

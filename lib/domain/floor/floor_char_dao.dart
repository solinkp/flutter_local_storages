import 'package:floor/floor.dart';

import 'package:flutter_local_storages/domain/floor/floor_char.dart';

@dao
abstract class FloorCharDao {
  @Query('SELECT * FROM FloorChar')
  Future<List<FloorChar>> findAllCharacters();

  @insert
  Future<void> insertCharacter(FloorChar character);

  @Query('DELETE FROM FloorChar')
  Future<void> deleteCharacters();
}

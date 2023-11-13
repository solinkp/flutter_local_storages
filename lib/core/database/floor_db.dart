import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:flutter_local_storages/domain/floor/floor_char.dart';
import 'package:flutter_local_storages/domain/floor/floor_char_dao.dart';

part 'floor_db.g.dart';

@Database(version: 1, entities: [FloorChar])
abstract class AppDB extends FloorDatabase {
  FloorCharDao get floorCharDao;
}

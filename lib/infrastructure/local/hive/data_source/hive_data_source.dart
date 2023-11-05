import 'package:injectable/injectable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_local_storages/domain/hive/hive_char.dart';
import 'package:flutter_local_storages/domain/character/character.dart';

abstract class IHiveDataSource {
  Future<List<HiveChar>> getHiveCharacters();
  Future<void> saveHiveCharacters(List<Character> characters);
  Future<void> cleanData();
}

@LazySingleton(as: IHiveDataSource)
class HiveDataSource implements IHiveDataSource {
  final HiveInterface hive;

  const HiveDataSource(this.hive);

  @override
  Future<List<HiveChar>> getHiveCharacters() async {
    return hive.box<HiveChar>('HiveCharBox').values.toList();
  }

  @override
  Future<void> saveHiveCharacters(List<Character> characters) async {
    var box = hive.box<HiveChar>('HiveCharBox');
    await box.clear();
    await box.addAll([...characters.map((e) => HiveChar.fromBase(e))]);
  }

  @override
  Future<void> cleanData() async {
    var box = hive.box<HiveChar>('HiveCharBox');
    await box.clear();
  }
}

import 'package:isar/isar.dart';

import 'package:flutter_local_storages/domain/character/base_domain.dart';

part 'isar_char.g.dart';

@collection
class IsarChar {
  Id isarId = Isar.autoIncrement;
  late int id;
  late String name;
  @enumerated
  late Status status;
  late String species;
  late String type;
  @enumerated
  late Gender gender;
  late String image;
  late String origin;

  IsarChar({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
    required this.origin,
  });

  factory IsarChar.fromBase(Character char) => IsarChar(
        id: char.id,
        name: char.name,
        status: char.status,
        species: char.species,
        type: char.type,
        gender: char.gender,
        image: char.image,
        origin: char.origin,
      );
}

extension IsarCharX on IsarChar {
  Character toBase() => Character(
        id: id,
        name: name,
        status: status,
        species: species,
        type: type,
        gender: gender,
        image: image,
        origin: origin,
      );
}

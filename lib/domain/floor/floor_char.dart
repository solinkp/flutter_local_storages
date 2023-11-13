import 'package:floor/floor.dart';

import 'package:flutter_local_storages/domain/character/base_domain.dart';

@entity
class FloorChar {
  @primaryKey
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String image;
  final String origin;

  const FloorChar({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
    required this.origin,
  });

  factory FloorChar.fromBase(Character char) => FloorChar(
        id: char.id,
        name: char.name,
        status: char.status.statusVal,
        species: char.species,
        type: char.type,
        gender: char.gender.genderVal,
        image: char.image,
        origin: char.origin,
      );
}

extension FloorCharX on FloorChar {
  Character toBase() => Character(
        id: id,
        name: name,
        status: Status.getStatusFromVal(status),
        species: species,
        type: type,
        gender: Gender.getGenderFromVal(gender),
        image: image,
        origin: origin,
      );
}

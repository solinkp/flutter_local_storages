import 'package:hive/hive.dart';

import 'package:flutter_local_storages/domain/character/base_domain.dart';

part 'hive_char.g.dart';

@HiveType(typeId: 1)
enum HiveStatus {
  @HiveField(0)
  alive('Alive'),
  @HiveField(1)
  dead('Dead'),
  @HiveField(2)
  unknown('Unknown');

  final String statusVal;
  const HiveStatus(this.statusVal);

  static HiveStatus getStatusFromVal(String val) => switch (val) {
        'Alive' => HiveStatus.alive,
        'Dead' => HiveStatus.dead,
        _ => HiveStatus.unknown,
      };
}

@HiveType(typeId: 2)
enum HiveGender {
  @HiveField(0)
  female('Female'),
  @HiveField(1)
  male('Male'),
  @HiveField(2)
  genderless('Genderless'),
  @HiveField(3)
  unknown('Unknown');

  final String genderVal;
  const HiveGender(this.genderVal);

  static HiveGender getGenderFromVal(String val) => switch (val) {
        'Female' => HiveGender.female,
        'Dead' => HiveGender.male,
        'Genderless' => HiveGender.genderless,
        _ => HiveGender.unknown,
      };
}

@HiveType(typeId: 0, adapterName: 'HiveCharAdapter')
class HiveChar {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late HiveStatus status;
  @HiveField(3)
  late String species;
  @HiveField(4)
  late String type;
  @HiveField(5)
  late HiveGender gender;
  @HiveField(6)
  late String image;
  @HiveField(7)
  late String origin;

  HiveChar({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
    required this.origin,
  });

  factory HiveChar.fromBase(Character char) => HiveChar(
        id: char.id,
        name: char.name,
        status: HiveStatus.getStatusFromVal(char.status.statusVal),
        species: char.species,
        type: char.type,
        gender: HiveGender.getGenderFromVal(char.gender.genderVal),
        image: char.image,
        origin: char.origin,
      );
}

extension HiveCharX on HiveChar {
  Character toBase() => Character(
        id: id,
        name: name,
        status: Status.getStatusFromVal(status.statusVal),
        species: species,
        type: type,
        gender: Gender.getGenderFromVal(gender.genderVal),
        image: image,
        origin: origin,
      );
}

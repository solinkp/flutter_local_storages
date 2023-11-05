import 'package:objectbox/objectbox.dart';

import 'package:flutter_local_storages/domain/character/base_domain.dart';

@Entity()
class ObjChar {
  @Id()
  int objId = 0;
  int id;
  String name;
  String species;
  String type;
  String image;
  String origin;

  @Transient()
  Status? status;
  String get dbStatus => status!.statusVal;
  set dbStatus(String val) {
    status = Status.getStatusFromVal(val);
  }

  @Transient()
  Gender? gender;
  String get dbGender => gender!.genderVal;
  set dbGender(String val) {
    gender = Gender.getGenderFromVal(val);
  }

  ObjChar({
    required this.id,
    required this.name,
    required this.species,
    required this.type,
    required this.image,
    required this.origin,
  });

  factory ObjChar.fromBase(Character char) {
    var obj = ObjChar(
      id: char.id,
      name: char.name,
      species: char.species,
      type: char.type,
      image: char.image,
      origin: char.origin,
    );
    obj.dbGender = char.gender.genderVal;
    obj.dbStatus = char.status.statusVal;
    return obj;
  }
}

extension ObjCharX on ObjChar {
  Character toBase() => Character(
        id: id,
        name: name,
        status: Status.getStatusFromVal(dbStatus),
        species: species,
        type: type,
        gender: Gender.getGenderFromVal(dbGender),
        image: image,
        origin: origin,
      );
}

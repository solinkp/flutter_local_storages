import 'package:realm/realm.dart';

import 'package:flutter_local_storages/domain/character/base_domain.dart';

part 'realm_char.g.dart';

@RealmModel()
class _RealmChar {
  @PrimaryKey()
  late int id;
  late String name;
  late String species;
  late String type;
  late String image;
  late String origin;
  //? enums to String
  late String status;
  late String gender;
}

extension RealmCharX on RealmChar {
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

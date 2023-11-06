import 'package:flutter_local_storages/domain/character/base_domain.dart';

class Character {
  final int id;
  final String name;
  final Status status;
  final String species;
  final String type;
  final Gender gender;
  final String image;
  final String origin;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
    required this.origin,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json['id'],
        name: json['name'],
        status: Status.getStatusFromVal(json['status']),
        species: json['species'],
        type: json['type'],
        gender: Gender.getGenderFromVal(json['gender']),
        image: json['image'],
        origin: json['origin']['name'],
      );

  factory Character.fromStoredJson(Map<String, dynamic> json) => Character(
        id: json['id'],
        name: json['name'],
        status: Status.getStatusFromVal(json['status']),
        species: json['species'],
        type: json['type'],
        gender: Gender.getGenderFromVal(json['gender']),
        image: json['image'],
        origin: json['origin'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'status': status.statusVal,
        'species': species,
        'type': type,
        'gender': gender.genderVal,
        'image': image,
        'origin': origin,
      };
}

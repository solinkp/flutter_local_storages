enum Gender {
  female('Female'),
  male('Male'),
  genderless('Genderless'),
  unknown('Unknown');

  final String genderVal;
  const Gender(this.genderVal);

  static Gender getGenderFromVal(String val) => switch (val) {
        'Female' => Gender.female,
        'Dead' => Gender.male,
        'Genderless' => Gender.genderless,
        _ => Gender.unknown,
      };
}

enum Status {
  alive('Alive'),
  dead('Dead'),
  unknown('Unknown');

  final String statusVal;
  const Status(this.statusVal);

  static Status getStatusFromVal(String val) => switch (val) {
        'Alive' => Status.alive,
        'Dead' => Status.dead,
        _ => Status.unknown,
      };
}

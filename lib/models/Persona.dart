class Persona {

  late String _name, _apellits, _email, _password;
  late DateTime _birthDate;

  Persona.nou({String? name, String? apellits, String? email, DateTime? birthDate, String? password}) {
    _name = name ?? "Nahuel";
    _apellits = apellits ?? "Medina";
    _email = email ?? "exemple@exe.com";
    _birthDate = birthDate ?? DateTime(-1);
    _password = password ?? "";
  }

  String get name => _name;
  String get apellits => _apellits;
  String get email => _email;
  String get password => _password;
  DateTime get birthDate => _birthDate;

  set name(String value) => _name = value;
  set apellits(String value) => _apellits = value;
  set email(String value) => _email = value;
  set password(String value) => _password = value;
  set birthDate(DateTime value) => _birthDate = value;

  @override
  String toString() {
    return 'Persona(name: $_name $_apellits, email: $_email, birthDate: $_birthDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Persona &&
        other._name == _name &&
        other._apellits == _apellits &&
        other._email == _email &&
        other.password == _password &&
        other._birthDate == _birthDate;
  }

  Persona copy() => Persona.nou(name: name, apellits: apellits, email: email, password: password, birthDate: birthDate);

  @override
  int get hashCode {
    return Object.hash(_name, _apellits, _email, _password, _birthDate);
  }

}
class Persona {

  late String _name, _apellits, _email, _adress, _password;
  late DateTime _birthDate;

  Persona.nou({String? name, String? apellits, String? email, String? adress, DateTime? birthDate, String? password}) {
    _name = name ?? "Nahuel";
    _apellits = apellits ?? "Medina";
    _email = email ?? "exemple@exe.com";
    _adress = adress ?? "Casa exemple";
    _birthDate = birthDate ?? DateTime.now();
    _password = password ?? "";
  }

  String get name => _name;
  String get apellits => _apellits;
  String get email => _email;
  String get adress => _adress;
  String get password => _password;
  DateTime get birthDate => _birthDate;

  set name(String value) => _name = value;
  set apellits(String value) => _apellits = value;
  set email(String value) => _email = value;
  set adress(String value) => _adress = value;
  set password(String value) => _password = value;
  set birthDate(DateTime value) => _birthDate = value;

  @override
  String toString() {
    return 'Persona(name: $_name $_apellits, email: $_email, adress: $_adress, birthDate: $_birthDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Persona &&
        other._name == _name &&
        other._apellits == _apellits &&
        other._email == _email &&
        other._adress == _adress &&
        other.password == _password &&
        other._birthDate == _birthDate;
  }

  @override
  int get hashCode {
    return Object.hash(_name, _apellits, _email, _adress, _password, _birthDate);
  }

}
class Persona {

  late String _name, _email, _adress;
  late DateTime _birthDate;

  Persona.nou({String? name, String? email, String? adress, DateTime? birthDate}) {
    _name = name ?? "Nahuel";
    _email = email ?? "exemple@exe.com";
    _adress = adress ?? "Casa exemple";
    _birthDate = birthDate ?? DateTime.now();
  }

  String get name => _name;
  String get email => _email;
  String get adress => _adress;
  DateTime get birthDate => _birthDate;

  set name(String value) => _name = value;
  set email(String value) => _email = value;
  set adress(String value) => _adress = value;
  set birthDate(DateTime value) => _birthDate = value;

  @override
  String toString() {
    return 'Persona(name: $_name, email: $_email, adress: $_adress, birthDate: $_birthDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Persona &&
        other._name == _name &&
        other._email == _email &&
        other._adress == _adress &&
        other._birthDate == _birthDate;
  }

  @override
  int get hashCode {
    return Object.hash(_name, _email, _adress, _birthDate);
  }

}
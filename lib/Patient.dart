class Patient{
  String _firstName;
  String _lastName;
  String _phoneNumber;
  String _email;

  Patient(this._firstName, this._lastName, this._phoneNumber, this._email);

  String get email => _email;

  String get phoneNumber => _phoneNumber;

  String get lastName => _lastName;

  String get firstName => _firstName;
}
class Doctor{
  String _firstName;
  String _lastName;
  String _drNumber;
  int _hNumber;
  String _degree;
  int _fee;
  String _city;
  String _tel;
  String _address;
  String _dur;
  String _id;
  String _weekday;
  String _image;
  String _email;

  Doctor(
      this._firstName,
      this._lastName,
      this._drNumber,
      this._hNumber,
      this._degree,
      this._fee,
      this._city,
      this._tel,
      this._address,
      this._dur,
      this._id,
      this._weekday,
      this._image,
      this._email);

  String get email => _email;

  String get image => _image;

  String get weekday => _weekday;

  String get id => _id;

  String get dur => _dur;

  String get address => _address;

  String get tel => _tel;

  String get city => _city;

  int get fee => _fee;

  String get degree => _degree;

  int get hNumber => _hNumber;

  String get drNumber => _drNumber;

  String get lastName => _lastName;

  String get firstName => _firstName;
}
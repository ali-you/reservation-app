class Doctor{
  int _drNumber;
  String _id;
  int _hNumber;
  String _degree;
  int _fee;
  String _dur;
  String _weekDay;
  String _image;

  Doctor(this._drNumber, this._id, this._hNumber, this._degree, this._fee,
      this._dur, this._weekDay, this._image);

  String get image => _image;

  String get weekDay => _weekDay;

  String get dur => _dur;

  int get fee => _fee;

  String get degree => _degree;

  int get hNumber => _hNumber;

  String get id => _id;

  int get drNumber => _drNumber;
}
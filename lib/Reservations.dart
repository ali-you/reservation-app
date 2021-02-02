import 'package:reservation/Doctor.dart';

class Reservations {
  static Reservations _instance;

  List<Doctor> _reserveItems;

  Reservations() {
    _reserveItems = List<Doctor>();
  }

  List<Doctor> get reserveItems => _reserveItems;

  set reserveItems(List<Doctor> value) {
    _reserveItems = value;
  }

  static Reservations getInstance() {
    if (_instance == null) _instance = Reservations();
    return _instance;
  }
}
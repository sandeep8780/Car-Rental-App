import 'car.dart';

class Booking {
  final String userName;
  final Car car;
  final String startDate;
  final String endDate;
  final String location;

  Booking({
    required this.userName,
    required this.car,
    required this.startDate,
    required this.endDate,
    required this.location,
  });
}

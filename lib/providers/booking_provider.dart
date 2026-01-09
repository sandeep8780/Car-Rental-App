import 'package:flutter/material.dart';
import '../models/booking.dart';

class BookingProvider extends ChangeNotifier {
  Booking? _booking;

  Booking? get booking => _booking;

  void setBooking(Booking booking) {
    _booking = booking;
    notifyListeners();
  }
}

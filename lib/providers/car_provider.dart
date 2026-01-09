import 'package:flutter/material.dart';
import '../data/mock_cars.dart';
import '../models/car.dart';

class CarProvider extends ChangeNotifier {
  List<Car> get cars => mockCars;
}

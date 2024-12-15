import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorProvider with ChangeNotifier {
  List<double> _accelerometerValues = [0.0, 0.0, 0.0];
  double _lightLevel = 0.0; // Variable to hold light level

  List<double> get accelerometerValues => _accelerometerValues;
  double get lightLevel => _lightLevel; // Getter for light level

  SensorProvider() {
    _initSensors();
  }

  void _initSensors() {
    // Listen to accelerometer changes directly
    accelerometerEvents.listen((AccelerometerEvent event) {
      _accelerometerValues = [event.x, event.y, event.z];
      notifyListeners();
    });
  }

  void updateLightLevel(double level) {
    _lightLevel = level;
    notifyListeners();
  }
}

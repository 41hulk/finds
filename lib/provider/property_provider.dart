import 'package:finds/config/http.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import '../models/property.dart';
import 'dart:io';

class PropertyProvider with ChangeNotifier {
  NetworHandler networHandler = NetworHandler();
  List<Property> _properties = [];
  bool _isLoading = false;

  List<Property> get properties => _properties;
  bool get isLoading => _isLoading;

  Future<void> fetchProperties() async {
    _isLoading = true;

    try {
      final response = await networHandler.get('/property/all');

      final List<dynamic> data = json.decode(response);
      _properties = data.map((json) => Property.fromJson(json)).toList();
    } catch (e) {
      print('Error fetching properties: $e'); // Log the error
      throw Exception('Failed to load properties');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

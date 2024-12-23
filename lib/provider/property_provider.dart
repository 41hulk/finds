import 'package:finds/config/http.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import '../models/property.dart';

class PropertyProvider with ChangeNotifier {
  NetworHandler networHandler = NetworHandler();
  List<Property> _properties = [];
  List<Property> _myProperties = [];
  bool _isLoading = false;

  List<Property> get properties => _properties;
  List<Property> get myProperties => _myProperties;

  bool get isLoading => _isLoading;

  Future<void> fetchProperties() async {
    _isLoading = true;

    try {
      final response = await networHandler.get('/property/all');

      final List<dynamic> data = json.decode(response);
      _properties = data.map((json) => Property.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load properties: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getMyProperties() async {
    _isLoading = true;

    try {
      final response = await networHandler.get('/property/myproperty');
      final List<dynamic> data = json.decode(response);
      _myProperties = data.map((json) => Property.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load my properties: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createProperty(Property property) async {
    try {
      // Implementation for creating a property
    } catch (e) {
      throw Exception('Failed to create property: $e');
    }
  }
}

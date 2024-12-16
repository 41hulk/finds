import 'package:finds/config/http.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import '../models/property.dart';

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

  Future<void> createProperty(Property property) async {
    try {
      // final response = await http.post(
      //   Uri.parse(
      //       'https://api.example.com/properties'), // Replace with your API URL
      //   headers: {'Content-Type': 'application/json'},
      //   body: json.encode({
      //     'userId': property.userId,
      //     'name': property.name,
      //     'description': property.description,
      //     'images': property.images,
      //     'pricePerNight': property.pricePerNight,
      //     'address': property.address,
      //     'created_at': property.created_at.toIso8601String(),
      //     'updated_at': property.updated_at.toIso8601String(),
      //   }),
      // );

      // if (response.statusCode == 201) {
      //   // Optionally, fetch properties again to update the list
      //   await fetchProperties();
      // } else {
      //   throw Exception('Failed to create property');
      // }
    } catch (e) {
      print('Error creating property: $e');
      throw Exception('Failed to create property');
    }
  }
}

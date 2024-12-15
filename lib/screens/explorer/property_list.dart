import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/property_provider.dart';
import '../../models/property.dart';

class PropertyList extends StatelessWidget {
  const PropertyList({super.key});

  @override
  Widget build(BuildContext context) {
    final propertyProvider = Provider.of<PropertyProvider>(context);

    return propertyProvider.isLoading
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: propertyProvider.properties.length,
            itemBuilder: (context, index) {
              final property = propertyProvider.properties[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(property.images.isNotEmpty ? property.images[0] : '', fit: BoxFit.cover),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            property.name,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(property.description),
                          const SizedBox(height: 8),
                          Text('\$${property.pricePerNight}', style: const TextStyle(color: Colors.green)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }
} 
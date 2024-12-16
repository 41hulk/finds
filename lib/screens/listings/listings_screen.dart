import 'package:finds/screens/explorer/property_list.dart';
import 'package:finds/screens/listings/create_property_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/property_provider.dart';

class ListingsScreen extends StatelessWidget {
  const ListingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final propertyProvider = Provider.of<PropertyProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('My Listings')),
      body: propertyProvider.properties.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No properties found.'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreatePropertyScreen(),
                        ),
                      );
                    },
                    child: const Text('Create Property'),
                  ),
                ],
              ),
            )
          : const PropertyList(),
    );
  }
}

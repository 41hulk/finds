import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/property_provider.dart';
import 'property_list.dart';

class ExplorerScreen extends StatefulWidget {
  const ExplorerScreen({super.key});

  @override
  State<ExplorerScreen> createState() => _ExplorerScreenState();
}

class _ExplorerScreenState extends State<ExplorerScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch properties when the screen is initialized
    Provider.of<PropertyProvider>(context, listen: false).fetchProperties();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(title: const Text('Explorer')),
      body: SafeArea(child: PropertyList()), // Use the PropertyList widget here
    );
  }
}

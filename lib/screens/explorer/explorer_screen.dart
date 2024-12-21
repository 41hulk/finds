import 'package:finds/screens/explorer/display_state.dart';
import 'package:finds/widgets/search_bar.dart';
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
    Provider.of<PropertyProvider>(context, listen: false).fetchProperties();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SearchBarAndFilter(),
            Expanded(
              child: DisplayState(),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:finds/provider/sensor_provider.dart';

class SensorDisplay extends StatelessWidget {
  const SensorDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final sensorProvider = Provider.of<SensorProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Sensor Data')),
      body: Center(
        // padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Light Level: ${sensorProvider.lightLevel}'),
            const SizedBox(height: 20),
            Text('Accelerometer: ${sensorProvider.accelerometerValues}'),
          ],
        ),
      ),
    );
  }
}

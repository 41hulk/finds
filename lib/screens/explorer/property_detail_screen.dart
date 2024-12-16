import 'package:flutter/material.dart';
import '../../models/property.dart';

class PropertyDetailScreen extends StatelessWidget {
  final Property property;

  const PropertyDetailScreen({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(property.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(property.images.isNotEmpty ? property.images[0] : '',
                fit: BoxFit.cover),
            const SizedBox(height: 16),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(property.user.avatar ??
                      'https://cdn1.iconfinder.com/data/icons/user-pictures/100/male3-512.png'),
                ),
                const SizedBox(width: 8),
                Text('@${property.user.username}'),
              ],
            ),
            Text(
              property.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(property.description),
            const SizedBox(height: 8),
            Text('💰\$${property.pricePerNight}/night',
                style: const TextStyle(color: Colors.green)),
            const SizedBox(height: 8),
            Text('Address: ${property.address}'),
            const SizedBox(height: 8),
            Text('Owner Id: ${property.user.id}'),
            // const SizedBox(height: 8),
            // Text('Avatar: ${property.user.avatar}'),
          ],
        ),
      ),
    );
  }
}

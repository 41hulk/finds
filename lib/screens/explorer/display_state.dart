import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:finds/provider/property_provider.dart';
import 'package:finds/screens/explorer/property_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisplayState extends StatefulWidget {
  const DisplayState({super.key});

  @override
  State<DisplayState> createState() => _DisplayStateState();
}

class _DisplayStateState extends State<DisplayState> {
  @override
  Widget build(BuildContext context) {
    final propertyProvider = Provider.of<PropertyProvider>(context);
    return propertyProvider.isLoading
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: propertyProvider.properties.length,
            itemBuilder: (context, index) {
              final property = propertyProvider.properties[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PropertyDetailScreen(property: property),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(property
                                    .user.avatar ??
                                'https://cdn1.iconfinder.com/data/icons/user-pictures/100/male3-512.png'),
                          ),
                          const SizedBox(width: 8),
                          Text('@${property.user.username}'),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: SizedBox(
                              height: 375,
                              width: double.infinity,
                              child: AnotherCarousel(
                                images: property.images
                                    .map((url) => NetworkImage(url))
                                    .toList(),
                                dotSize: 6,
                                indicatorBgPadding: 5,
                                dotBgColor: Colors.transparent,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: 15,
                            right: 15,
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 5,
                                    ),
                                    child: Text(
                                      "💰${property.pricePerNight}/night - 2🛏️",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                // for favorite button
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    // white border
                                    const Icon(
                                      Icons.favorite_outline_rounded,
                                      size: 34,
                                      color: Colors.white,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // provider.toggleFavorite(place);
                                      },
                                      child: const Icon(Icons.favorite,
                                          size: 30, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}

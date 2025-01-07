import 'package:finds/provider/property_provider.dart';
import 'package:finds/screens/explorer/property_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListingDisplay extends StatefulWidget {
  const ListingDisplay({super.key});

  @override
  State<ListingDisplay> createState() => _ListingDisplayState();
}

class _ListingDisplayState extends State<ListingDisplay> {
  @override
  Widget build(BuildContext context) {
    final propertyProvider = Provider.of<PropertyProvider>(context);
    return propertyProvider.isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: propertyProvider.myProperties.length,
            itemBuilder: (context, index) {
              final property = propertyProvider.myProperties[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                  child: Row(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 85,
                            width: 75,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(property.images[0]),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -10,
                            right: -18,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(property
                                      .user.avatar ??
                                  'https://cdn1.iconfinder.com/data/icons/user-pictures/100/male3-512.png'),
                              backgroundColor: Colors.white,
                              radius: 25,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 19),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              property.name,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              " 💰 ${property.pricePerNight}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                height: 1.4,
                                fontSize: 17,
                                color: Color.fromARGB(137, 49, 255, 162),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
    // : Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         const Text('List your home on finds🚀 '),
    //         const SizedBox(height: 20),
    //         ElevatedButton(
    //           style: ElevatedButton.styleFrom(
    //             padding: const EdgeInsets.symmetric(
    //               vertical: 10,
    //             ),
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(10.0),
    //             ),
    //           ),
    //           onPressed: () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                 builder: (context) => const CreatePropertyScreen(),
    //               ),
    //             );
    //           },
    //           child: const Text('Create Property'),
    //         ),
    //       ],
    //     ),
    //   );
  }
}

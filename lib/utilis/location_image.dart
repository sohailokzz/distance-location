import 'package:flutter/material.dart';

import '../data/dummy_locations.dart';

class LocationImage extends StatelessWidget {
  const LocationImage({
    Key? key,
    required this.height,
    required this.width,
    required this.allLocations,
    required this.index,
  }) : super(key: key);

  final double height;
  final double width;
  final Locations allLocations;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.12,
      width: width,
      child: Image.network(
        allLocations.dummyLocations[index]['image'],
        fit: BoxFit.cover,
      ),
    );
  }
}

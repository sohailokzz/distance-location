import 'package:flutter/material.dart';

import '../data/dummy_locations.dart';

class LocationName extends StatelessWidget {
  const LocationName({
    Key? key,
    required this.allLocations,
    required this.index,
  }) : super(key: key);

  final Locations allLocations;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        allLocations.dummyLocations[index]['name'],
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

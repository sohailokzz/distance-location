import 'package:flutter/material.dart';

import '../data/dummy_locations.dart';

class DistanceAway extends StatelessWidget {
  const DistanceAway({
    Key? key,
    required this.allLocations,
    required this.index,
  }) : super(key: key);

  final Locations allLocations;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.location_on,
          color: Colors.red,
        ),
        Text(
          "${allLocations.dummyLocations[index]['distance'].round().toString()} KM Away",
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

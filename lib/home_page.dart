import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:task1_distance/data/dummy_locations.dart';

import 'utilis/distance_away.dart';
import 'utilis/location_image.dart';
import 'utilis/location_name.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position? _currentUserPosition;
  double? distanceInMeter = 0.0;
  Locations allLocations = Locations();

  Future _getTheDistance() async {
    _currentUserPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    for (int i = 0; i < allLocations.dummyLocations.length; i++) {
      double storeLat = allLocations.dummyLocations[i]['lat'];
      double storeLng = allLocations.dummyLocations[i]['lng'];

      distanceInMeter = Geolocator.distanceBetween(
        _currentUserPosition!.latitude,
        _currentUserPosition!.longitude,
        storeLat,
        storeLng,
      );
      var distance = distanceInMeter?.round().toInt();

      allLocations.dummyLocations[i]['distance'] = (distance! / 100);
      setState(() {});
    }
  }

  @override
  void initState() {
    _getTheDistance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Locations Near You'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: GridView.builder(
          itemCount: allLocations.dummyLocations.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 3,
          ),
          itemBuilder: (context, index) {
            return Container(
              color: Colors.blueAccent,
              height: height * 9,
              width: width * 0.3,
              child: Column(
                children: [
                  LocationImage(
                    height: height,
                    width: width,
                    allLocations: allLocations,
                    index: index,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  LocationName(
                    allLocations: allLocations,
                    index: index,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  DistanceAway(
                    allLocations: allLocations,
                    index: index,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

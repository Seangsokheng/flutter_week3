import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/dummy_data/dummy_data.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../../theme/theme.dart';

class RidesScreen extends StatelessWidget {
  final RidePref ridePref;

  const RidesScreen({super.key, required this.ridePref});

  @override
  Widget build(BuildContext context) {
    // Filter rides based on selected ride preferences
    final matchingRides = fakeRides.where((ride) {
      return ride.departureLocation == ridePref.departure &&
          ride.arrivalLocation == ridePref.arrival;
    }).toList();
    print(matchingRides);
    print(fakeRides);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Matching Rides"),
      ),
      body: matchingRides.isEmpty
          ? Center(child: Text("No rides found", style: BlaTextStyles.body))
          : ListView.builder(
              padding: const EdgeInsets.all(BlaSpacings.m),
              itemCount: matchingRides.length,
              itemBuilder: (context, index) {
                final ride = matchingRides[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(BlaSpacings.radius),
                  ),
                  child: ListTile(
                    title: Text("Departure: ${ride.departureLocation.name}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Arrival: ${ride.arrivalLocation.name}"),
                        Text("Time: ${ride.departureDate}"),
                        Text("Seats Available: ${ride.availableSeats}"),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

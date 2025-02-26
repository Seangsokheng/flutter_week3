import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';

import '../dummy_data/dummy_data.dart';
import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {

  static List<Ride> availableRides = fakeRides;   // TODO for now fake data


  ///
  ///  Return the relevant rides, given the passenger preferences
  ///
  static List<Ride> getRidesFor(RidePref preferences) {
    //  print(availableRides);
    
    // For now, just a test
    return availableRides.where( (ride) => ride.departureLocation == preferences.departure && ride.arrivalLocation == preferences.arrival).toList();
  }
 
}
void main() {
  print("Available rides today:");
  //print(RidesService.availableRides);

  // Filter the today rides by comparing today with the ride from fake data
  DateTime today = DateTime.now();
  List<Ride> todayRides = RidesService.availableRides.where((ride) {
    return ride.departureDate.year == today.year &&
        ride.departureDate.month == today.month &&
        ride.departureDate.day == today.day;
  }).toList();

  if (todayRides.isEmpty) {
    print("No rides available today.");
  } else {
    for (Ride ride in todayRides) {
      print(
          "From ${ride.departureLocation.name} to ${ride.arrivalLocation.name} at ${ride.departureDate}, Seats: ${ride.availableSeats}, Price: ${ride.pricePerSeat}€");
    }
  }
}

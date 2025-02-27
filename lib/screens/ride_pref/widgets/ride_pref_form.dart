import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/model/componet/bla_button_model.dart';
import 'package:week_3_blabla_project/screens/test_screens/widgets/bla_button.dart';
import 'package:week_3_blabla_project/utils/date_time_util.dart';
import 'package:week_3_blabla_project/widgets/inputs/ride_form_fields.dart';
import 'package:week_3_blabla_project/theme/theme.dart';
import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';

/// A Ride Preference Form is a view to select:
///   - A departure location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  // Controllers for the text fields
  final TextEditingController _departureController = TextEditingController();
  final TextEditingController _arrivalController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _seatsController = TextEditingController();

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------
  @override
  void initState() {
    super.initState();
    
    // Initialize with default values or values from initRidePref
    if (widget.initRidePref != null) {
      departure = widget.initRidePref!.departure;
      arrival = widget.initRidePref!.arrival;
      departureDate = widget.initRidePref!.departureDate;
      requestedSeats = widget.initRidePref!.requestedSeats;
      
      // Set the text field values
      if (departure != null) _departureController.text = departure!.name;
      if (arrival != null) _arrivalController.text = arrival!.name;
      _dateController.text = _formatDate(departureDate);
      _seatsController.text = requestedSeats.toString();
    } else {
      // Default values
      departureDate = DateTime.now();
      requestedSeats = 1;
      
      // Set default values in text fields
      _dateController.text = _formatDate(departureDate);
      _seatsController.text = requestedSeats.toString();
    }
  }

  @override
  void dispose() {
    _departureController.dispose();
    _arrivalController.dispose();
    _dateController.dispose();
    _seatsController.dispose();
    super.dispose();
  }

  // Format date to display in the text field
  String _formatDate(DateTime date) {
    return "${DateTimeUtils.formatDateTime(date)}";
  }


  // ----------------------------------
  // Handle events
  // ----------------------------------
  
  // Handle departure location selection
  void _handleDepartureSelection(Location location) {
    setState(() {
      departure = location;
      _departureController.text = location.name;
    });
  }

  // Handle arrival location selection
  void _handleArrivalSelection(Location location) {
    setState(() {
      arrival = location;
      _arrivalController.text = location.name;
    });
  }

  // Validate form and handle search
  bool _validateForm() {
    return departure != null && arrival != null;
  }

  void _handleSearch() {
    if (_validateForm()) {
      final ridePref = RidePref(
        departure: departure!,
        arrival: arrival!,
        departureDate: departureDate,
        requestedSeats: requestedSeats,
      );
      
      // Return the created ridePref or navigate to results
      Navigator.pop(context, ridePref);
    }
  }

  // Handle switch location action
void _switchLocations() {
  setState(() {
    final temp = departure;
    departure = arrival;
    arrival = temp;

    // Update text fields
    _departureController.text = departure?.name ?? '';
    _arrivalController.text = arrival?.name ?? '';
  });
}
  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------
  

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(BlaSpacings.l),
      decoration: BoxDecoration(
        color: BlaColors.white,
        borderRadius: BorderRadius.circular(BlaSpacings.radius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: RideFormFields().buildLocationField(
                  context: context,
                  labelText: 'Departure',
                  controller: _departureController,
                  icon: Icons.radio_button_checked,
                  onLocationSelected: _handleDepartureSelection,
                ),
              ),
              IconButton(
                icon: Icon(Icons.swap_vert, color: BlaColors.primary),
                onPressed: _switchLocations,
              ),
              Expanded(
                child: RideFormFields().buildLocationField(
                  context: context,
                  labelText: 'Arrival',
                  controller: _arrivalController,
                  icon: Icons.radio_button_checked,
                  onLocationSelected: _handleArrivalSelection,
                ),
              ),
            ],
          ),
          RideFormFields.buildDateField(_dateController),
          RideFormFields.buildSeatsField(_seatsController),
          const SizedBox(height: BlaSpacings.l),
          BlaButton(
            model: BlaButtonModel(
              text: "Search",
              onPressed: _validateForm() ? () => _handleSearch() : () {},
            ),
          ),
        ],
      ),
    );
  }
}
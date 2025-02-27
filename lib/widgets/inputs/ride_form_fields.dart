import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/screens/search_location/search_location_screen.dart';
import 'package:week_3_blabla_project/theme/theme.dart';
import 'package:week_3_blabla_project/model/componet/bla_button_model.dart';
import 'package:week_3_blabla_project/screens/test_screens/widgets/bla_button.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/utils/animations_util.dart';

class RideFormFields {
  // Navigate to the LocationPicker screen
   void navigateToLocationPicker(
      BuildContext context, Function(Location) onLocationSelected) async {
    final selectedLocation = await Navigator.push(
      context,
      AnimationUtils.createBottomToTopRoute(
        LocationPicker(onLocationSelected: onLocationSelected),
      ),
    );

    if (selectedLocation != null) {
      onLocationSelected(selectedLocation);
    }
  }

  // Build location field
  Widget buildLocationField({
    required BuildContext context,
    required String labelText,
    required TextEditingController controller,
    required IconData icon,
    required Function(Location) onLocationSelected,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: BlaSpacings.m),
      decoration: BoxDecoration(
        color: BlaColors.white,
        borderRadius: BorderRadius.circular(BlaSpacings.radius),
        border: Border.all(color: BlaColors.greyLight),
      ),
      child: ListTile(
        leading: Icon(icon, color: BlaColors.iconNormal),
        title: TextField(
          controller: controller,
          style: BlaTextStyles.body?.copyWith(color: BlaColors.textNormal) ?? 
                 const TextStyle(color: Colors.black), // Fallback text style
          decoration: InputDecoration(
            hintText: labelText,
            hintStyle: BlaTextStyles.body?.copyWith(color: BlaColors.textLight) ?? 
                       const TextStyle(color: Colors.grey), // Fallback hint style
            border: InputBorder.none,
          ),
          readOnly: true,
        ),
        onTap: () {
          navigateToLocationPicker(context, onLocationSelected);
        },
      ),
    );
  }

  // Build date field
  static Widget buildDateField(TextEditingController dateController) {
    return Container(
      margin: const EdgeInsets.only(bottom: BlaSpacings.m),
      decoration: BoxDecoration(
        color: BlaColors.white,
        borderRadius: BorderRadius.circular(BlaSpacings.radius),
        border: Border.all(color: BlaColors.greyLight),
      ),
      child: ListTile(
        leading: Icon(Icons.calendar_today, color: BlaColors.iconNormal),
        title: TextField(
          controller: dateController,
          style: BlaTextStyles.body?.copyWith(color: BlaColors.textNormal) ?? 
                 const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: 'Date',
            hintStyle: BlaTextStyles.body?.copyWith(color: BlaColors.textLight) ?? 
                       const TextStyle(color: Colors.grey),
            border: InputBorder.none,
          ),
          readOnly: true,
        ),
      ),
    );
  }

  // Build seats field
  static Widget buildSeatsField(TextEditingController seatsController) {
    return Container(
      margin: const EdgeInsets.only(bottom: BlaSpacings.m),
      decoration: BoxDecoration(
        color: BlaColors.white,
        borderRadius: BorderRadius.circular(BlaSpacings.radius),
        border: Border.all(color: BlaColors.greyLight),
      ),
      child: ListTile(
        leading: Icon(Icons.person, color: BlaColors.iconNormal),
        title: TextField(
          controller: seatsController,
          style: BlaTextStyles.body?.copyWith(color: BlaColors.textNormal) ?? 
                 const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: 'Number of seats',
            hintStyle: BlaTextStyles.body?.copyWith(color: BlaColors.textLight) ?? 
                       const TextStyle(color: Colors.grey),
            border: InputBorder.none,
          ),
          readOnly: true,
        ),
      ),
    );
  }

  // Build search button
  static Widget buildSearchButton(VoidCallback onSearchPressed, bool isEnabled) {
    return BlaButton(
      model: BlaButtonModel(
        text: "Search",
        onPressed: isEnabled ? onSearchPressed : () {},
      ),
    );
  }
}

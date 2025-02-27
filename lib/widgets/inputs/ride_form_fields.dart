import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/dummy_data/dummy_data.dart';
import 'package:week_3_blabla_project/theme/theme.dart';
import 'package:week_3_blabla_project/model/componet/bla_button_model.dart';
import 'package:week_3_blabla_project/screens/test_screens/widgets/bla_button.dart';
import '../../../model/ride/locations.dart';

class RideFormFields {
  // Show location selector (simplified)
  void showLocationSelector(
      BuildContext context, Function(Location) onLocationSelected) {
    // Example locations
    final List<Location> locations = fakeLocations;

    showModalBottomSheet(
      context: context,
      builder: (context) => ListView(
        children: locations
            .map((location) => ListTile(
                  title: Text(location.name),
                  onTap: () {
                    onLocationSelected(location);
                    Navigator.pop(context);
                  },
                ))
            .toList(),
      ),
    );
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
          style: BlaTextStyles.body.copyWith(color: BlaColors.textNormal),
          decoration: InputDecoration(
            hintText: labelText,
            hintStyle: BlaTextStyles.body.copyWith(color: BlaColors.textLight),
            border: InputBorder.none,
          ),
          readOnly: true,
        ),
        onTap: () {
          showLocationSelector(context, onLocationSelected);
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
          style: BlaTextStyles.body.copyWith(color: BlaColors.textNormal),
          decoration: InputDecoration(
            hintText: 'Date',
            hintStyle: BlaTextStyles.body.copyWith(color: BlaColors.textLight),
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
          style: BlaTextStyles.body.copyWith(color: BlaColors.textNormal),
          decoration: InputDecoration(
            hintText: 'Number of seats',
            hintStyle: BlaTextStyles.body.copyWith(color: BlaColors.textLight),
            border: InputBorder.none,
          ),
          readOnly: true,
        ),
      ),
    );
  }

  // Build search button
  static Widget buildSearchButton(
      VoidCallback onSearchPressed, bool isEnabled) {
    return BlaButton(
      model: BlaButtonModel(
        text: "Search",
        onPressed: isEnabled ? onSearchPressed : () {},
      ),
    );
  }
}

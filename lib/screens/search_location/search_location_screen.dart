import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/dummy_data/dummy_data.dart';
import 'package:week_3_blabla_project/theme/theme.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';

/// LocationPicker widget
class LocationPicker extends StatefulWidget {
  final Function(Location) onLocationSelected;
  
  const LocationPicker({ required this.onLocationSelected});

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  final TextEditingController _searchController = TextEditingController();
  List<Location> _allLocations = [];
  List<Location> _filteredLocations = [];

  @override
  void initState() {
    super.initState();
    _allLocations = fakeLocations;
    _filteredLocations = _allLocations;
    _searchController.addListener(_filterLocations);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterLocations() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredLocations = query.isEmpty
          ? _allLocations
          : _allLocations
              .where((loc) => loc.name.toLowerCase().contains(query))
              .toList();
    });
  }

  void _handleLocationSelected(Location location) {
    widget.onLocationSelected(location);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: "Search for a location",
            border: InputBorder.none,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _filteredLocations.length,
        itemBuilder: (context, index) {
          final location = _filteredLocations[index];
          return ListTile(
            title: Text(location.name),
            onTap: () => _handleLocationSelected(location),
          );
        },
      ),
    );
  }
}

/// Show location picker
Future<Location?> showLocationPicker({
  required BuildContext context,
}) async {
  return await showModalBottomSheet<Location>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return LocationPicker(
        onLocationSelected: (location) {
          Navigator.pop(context, location);
        },
      );
    },
  );
}

import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/model/componet/bla_button_model.dart';
import 'package:week_3_blabla_project/screens/test_screens/widgets/bla_button.dart';
import 'package:lucide_icons/lucide_icons.dart';


class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BlaButton Variations')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlaButton(
              model: BlaButtonModel(
                text: "Contact Volodia",
                icon: LucideIcons.messageCircle,
                onPressed: () => debugPrint("Contact clicked"),
                isPrimary: false,
              ),
            ),
            const SizedBox(height: 10),
            BlaButton(
              model: BlaButtonModel(
                text: "Request to Book",
                icon: LucideIcons.calendarPlus,
                onPressed: () => debugPrint("Booking requested"),
                isPrimary: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

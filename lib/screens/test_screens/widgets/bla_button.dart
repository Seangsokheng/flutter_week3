import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/model/componet/bla_button_model.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

class BlaButton extends StatelessWidget {
  final BlaButtonModel model;

  const BlaButton({ required this.model});

  @override
   Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: model.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: model.isPrimary ? BlaColors.primary : BlaColors.disabled,
        foregroundColor: model.isPrimary ? BlaColors.white : BlaColors.textNormal,
        padding: EdgeInsets.symmetric(horizontal: BlaSpacings.l, vertical: BlaSpacings.s),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BlaSpacings.radius),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (model.icon != null) Icon(model.icon, size: 18, color: BlaColors.iconNormal),
          if (model.icon != null) const SizedBox(width: 8),
          Text(model.text, style: BlaTextStyles.button),
        ],
      ),
    );
  }
}

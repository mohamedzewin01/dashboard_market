import 'package:flutter/material.dart';



class SwitchStatusBanner extends StatefulWidget {
  const SwitchStatusBanner({
    super.key, this.onChanged, required this.value,

  });


final void Function(bool)? onChanged;
final bool value;
  @override
  State<SwitchStatusBanner> createState() => _SwitchStatusBannerState();
}

class _SwitchStatusBannerState extends State<SwitchStatusBanner> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: .6,
      child: Switch(
        mouseCursor: SystemMouseCursors.click,
        activeTrackColor: Colors.lightGreen.shade400,
        activeColor: Colors.green.shade800,
        inactiveThumbColor: Colors.grey.shade400,
        inactiveTrackColor: Colors.grey.shade300,
        value:widget.value,
        onChanged:widget.onChanged,
      ),

    );
  }
}

import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  const SwitchButton({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.2,
      child: Switch.adaptive(
          activeColor: Colors.black26.withOpacity(0.9),
          activeTrackColor: Colors.blue,
          inactiveThumbColor: Colors.yellow,
          inactiveTrackColor: Colors.grey,
          thumbColor: MaterialStateProperty.all(Colors.red),
          trackColor: MaterialStateProperty.all(Colors.red),
          overlayColor: MaterialStateProperty.all(Colors.red),
          hoverColor: Colors.red,
          splashRadius: 10,
          value: _value,
          onChanged: (value) {
            setState(() {
              _value = value;
            });
            widget.onChanged.call(_value);
          }),
    );
  }
}

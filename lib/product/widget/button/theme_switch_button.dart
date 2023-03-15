import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/init/bloc/bloc_theme.dart';

class ThemeSwitchButton extends StatefulWidget {
  const ThemeSwitchButton({Key? key}) : super(key: key);

  @override
  State<ThemeSwitchButton> createState() => _ThemeSwitchButtonState();
}

class _ThemeSwitchButtonState extends State<ThemeSwitchButton> {
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
              context.read<ThemeCubit>().toggleTheme();
            });
          }),
    );
  }
}

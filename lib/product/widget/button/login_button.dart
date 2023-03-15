import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';
import '../../../core/widget/button/circular_button.dart';
import '../../../core/widget/circular_progress_indicator/circular_progress_indicator_blue.dart';

class LoginButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color? color;
  final Color? textColor;
  final double? width;
  const LoginButton({Key? key, this.onPressed, required this.text, this.color, this.textColor, this.width}) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool _processState = false;
  void _changeProcessState() {
    setState(() {
      _processState = !_processState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CircularButton(
      width: widget.width ?? context.screenWidth / 1.5,
      text: _processState == true
          ? const CircularProgressIndicatorBlue(
              strokeWidth: 2.5,
            )
          : Text(widget.text, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: widget.textColor ?? Colors.white, fontWeight: FontWeight.w500, fontSize: 16)),
      textColor: widget.textColor,
      color: widget.color,
      onPressed: _processState == true
          ? null
          : () async {
              if (widget.onPressed != null) {
                _changeProcessState();
                await Future(widget.onPressed!).then((value) {
                  _changeProcessState();
                });
              }
            },
    );
  }
}

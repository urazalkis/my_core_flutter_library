import 'package:flutter/material.dart';

import '../../../core/widget/button/circular_button.dart';
import '../../model/social_adapter.dart';
import '../../model/user_model.dart';

class SocialButton extends StatelessWidget {
  final ISocialAdapter adapter;
  final ValueChanged<UserModel?> onCompleted;
  const SocialButton({
    Key? key,
    required this.adapter,
    required this.onCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularButton(
      text: Text(
        adapter.model.title,
        style: TextStyle(color: adapter.model.color, fontSize: 16),
      ),
      icon: adapter.model.icon,
      textColor: adapter.model.color,
      color: Colors.white,
      borderColor: Colors.black,
      onPressed: () async {
        final result = await adapter.login.call();
        onCompleted.call(result);
      },
    );
  }
}

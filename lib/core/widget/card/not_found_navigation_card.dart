import 'package:flutter/material.dart';

class NotFoundNavigationCard extends StatelessWidget {
  const NotFoundNavigationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.blueGrey,
              shape: const OutlineInputBorder(),
              elevation: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'SAYFA BULUNAMADI!',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    ));
  }
}

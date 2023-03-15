import 'package:flutter/material.dart';
import 'package:flutter_my_core_library/core/extension/context_extension.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: context.screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => SizedBox(
                            height: context.screenHeight / 1.2,
                            child: Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('close'),
                              ),
                            ),
                          ));
                },
                child: Text('show bottom sheet')),
          ],
        ),
      ),
    );
  }
}

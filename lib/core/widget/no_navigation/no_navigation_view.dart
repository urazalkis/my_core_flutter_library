import 'package:flutter/material.dart';

import '/core/init/navigation/navigation_route.dart';
import '/core/init/navigation/navigation_service.dart';
import '../../constant/asset/image_path_constant.dart';
import '../../extension/context_extension.dart';

class NotFoundNavigationView extends StatelessWidget {
  const NotFoundNavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 120,
                  color: Color(0xff972d91),
                ),
                Image.asset(
                  ImagePathConstant.noPage,
                  height: context.screenHeight / 3,
                  width: context.screenWidth * 0.8,
                ),
                SizedBox(
                  width: context.screenWidth * 0.8,
                  height: context.screenHeight * 0.07,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                        const Color(0xFF972D91),
                      )),
                      onPressed: () {
                        NavigationService.instance.navigateToPageClear(path: NavigationRoute.instance.initialRoute());
                      },
                      child: const Text(
                        "Ana sayfaya dön",
                        style: TextStyle(fontSize: 20),
                      )),
                ),
              ],
            )
          ],
        ),
      ],
    ));
  }
}

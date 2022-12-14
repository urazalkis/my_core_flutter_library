import 'package:flutter/material.dart';
import 'package:flutter_my_core_library/core/extension/context_extension.dart';
import 'package:flutter_my_core_library/core/init/navigation/navigation_route.dart';
import 'package:flutter_my_core_library/core/init/navigation/navigation_service.dart';

import '../../constant/enum/image_path_enum.dart';

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
                  color: Color(0xfff972d91),
                ),
                Image.asset(
                  ImagePath.noPage.path,
                  height: context.screenHeight / 3,
                  width: context.screenWidth * 0.8,
                ),
                SizedBox(
                  width: context.screenWidth * 0.8,
                  height: context.screenHeight * 0.07,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                        Color(0xFFF972D91),
                      )),
                      onPressed: () {
                        NavigationService.instance.navigateToPageClear(
                            path: NavigationRoute.instance.initialRoute());
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

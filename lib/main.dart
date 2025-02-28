import 'package:day_eight_test/core/constants/app_colors.dart';
import 'package:day_eight_test/features/todos/presentation/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'core/constants/app_colors.dart';

void main() {
  runApp(ScreenUtilInit(
    builder: (context,build) => MaterialApp(
      home: TestScreen(),
    ),
    designSize: const Size(431, 844),
    minTextAdapt: true,
    splitScreenMode: true,
    child: TestScreen(),
  ));
}

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor:AppColors.backGroundColor,
      onInit: () {
        debugPrint("On Init");
      },
      onEnd: () {
        debugPrint("On End");
      },
      childWidget: SizedBox(
        height: 200.h,
        width: 200.w,
        child: SvgPicture.asset("assets/svgs/logo.svg"  ),
      ),
      onAnimationEnd: () => debugPrint("On Fade In End"),
      nextScreen: const FirstScreen(),
    );
  }
}

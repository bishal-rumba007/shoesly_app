

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesly_app/core/themes/theme.dart';
import 'package:shoesly_app/src/discover/presentation/pages/discover_page.dart';


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, _) {
        return MaterialApp(
          title: 'Shoes Market Place',
          debugShowCheckedModeBanner: false,
          theme: lightMode,
          home: const DiscoverPage(),
        );
      },
    );
  }
}



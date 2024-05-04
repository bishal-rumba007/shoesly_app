import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesly_app/core/routes/app_routes.dart';
import 'package:shoesly_app/core/themes/theme.dart';


class MainApp extends StatelessWidget {
  MainApp({super.key});

  final appRouter = AppRoutes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: appRouter.router.routeInformationProvider,
      routerDelegate: appRouter.router.routerDelegate,
      routeInformationParser: appRouter.router.routeInformationParser,
      title: 'Shoes Market Place',
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        ScreenUtil.init(context, designSize: const Size(375, 812));
        return Theme(
          data: lightMode,
          child: child!,
        );
      },
    );
  }
}



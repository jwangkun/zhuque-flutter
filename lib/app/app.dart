import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zhuque_flutter_demo/core/theme/tdesign_theme.dart';

import 'router/app_router.dart';

class TuniaoApp extends ConsumerWidget {
  const TuniaoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: '朱雀UI Flutter',
          debugShowCheckedModeBanner: false,
          theme: TDesignTheme.lightTheme,
          darkTheme: TDesignTheme.darkTheme,
          routerConfig: router,
          builder: (context, child) {
            return child!;
          },
        );
      },
    );
  }
}

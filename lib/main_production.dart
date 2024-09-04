import 'package:flutter/material.dart';
import 'package:flutter_advanced_app/core/di/dependancy_injection.dart';
import 'package:flutter_advanced_app/core/routing/app_router.dart';
import 'package:flutter_advanced_app/doc_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  setUpGetIt();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}

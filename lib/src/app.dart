import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routes/navigation.dart';
import 'core/routes/route_generator.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, _) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigationKey,
        onGenerateRoute: RouteGenerator.onGenerate,
      ),
    );
  }
}

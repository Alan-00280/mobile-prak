import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_flutter/core/constant/app_constant.dart';
import 'package:hello_flutter/core/theme/app_theme.dart';
import 'package:hello_flutter/features/dashboard/presentation/pages/dashboard_page.dart';
void main() {
  runApp(
    ProviderScope(
      child: MyApp()
    )
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: DashboardPage(),
    );
  }
}

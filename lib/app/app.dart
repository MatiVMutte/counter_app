import 'package:flutter/material.dart';
import 'package:flutter_clean_app/config/routes/app_router.dart';
import 'package:flutter_clean_app/config/theme/app_theme.dart';
import 'package:flutter_clean_app/config/theme/provider/light_dark_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(lightDarkProvider);

    return MaterialApp.router(
      title: "Counter App",
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      themeMode: theme.value,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
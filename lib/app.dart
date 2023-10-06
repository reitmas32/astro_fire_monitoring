import 'package:astro_fire_monitoring/ui/pages/error.dart';
import 'package:astro_fire_monitoring/ui/pages/home.dart';
import 'package:astro_fire_monitoring/ui/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AstroFireApp extends ConsumerStatefulWidget {
  @override
  ConsumerState<AstroFireApp> createState() => _AstroFireAppState();
}

class _AstroFireAppState extends ConsumerState<AstroFireApp> {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => HomePage(),
      ),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(isDarkModeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: isDarkMode ? AppTheme.uniDarkTheme : AppTheme.uniLightTheme,
      darkTheme: AppTheme.uniDarkTheme,
      themeMode: ThemeMode.light,
    );
  }
}

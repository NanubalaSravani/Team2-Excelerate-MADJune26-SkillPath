import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/program_listing_screen.dart';
import 'screens/program_details_screen.dart';

void main() {
  runApp(const ExcelerateApp());
}

/// Root widget for the Excelerate SkillPath app.
///
/// Defines the navigation routes for each screen using
/// MaterialApp's `routes` property, and applies a global
/// ThemeData (see theme/app_theme.dart) so colors, fonts,
/// and component styles stay consistent across the app.
///
/// Navigation flow:
///   Login (/) -> Home (/home) -> Program Listing (/programs)
///     -> Program Details (/program-details)
class ExcelerateApp extends StatelessWidget {
  const ExcelerateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Excelerate SkillPath',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/programs': (context) => const ProgramListingScreen(),
        '/program-details': (context) => const ProgramDetailsScreen(),
      },
    );
  }
}

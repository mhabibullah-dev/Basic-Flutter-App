import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme/app_theme.dart';
import 'screens/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock to portrait for this mobile app
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const ArchitecturalAnchorApp());
}

/// Root application widget.
///
/// Wires up the [AppTheme] design system from the Stitch project and sets
/// [LoginScreen] as the initial route.
class ArchitecturalAnchorApp extends StatelessWidget {
  const ArchitecturalAnchorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Architectural Anchor',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LoginScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/homepage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_train_app/provider/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(
        builder: (context, ref, child) {
          final themeMode = ref.watch(themeModeProvider);
          return MaterialApp(
            themeMode: themeMode, // 프로바이더에서 테마 모드 가져오기
            title: 'Train Booking',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.dark,
              scaffoldBackgroundColor: Colors.grey[900],
              textTheme: const TextTheme(
                bodyLarge: TextStyle(color: Colors.white),
                bodyMedium: TextStyle(color: Colors.white),
              ),
            ),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
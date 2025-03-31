import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 테마 모드 상태를 관리하는 프로바이더
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.dark);
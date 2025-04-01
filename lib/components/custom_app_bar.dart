import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/theme_provider.dart';

/// 간단한 현재 페이지의 소개와 우측의 아이콘 클릭을 통한 다크모드-일반모드 기능
class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          icon: Icon(
            themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
          ),
          onPressed: () {
            ref.read(themeModeProvider.notifier).state =
            themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
import 'package:flutter/material.dart';
import 'package:flutter_clean_app/config/utils/local_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'light_dark_provider.g.dart';

@Riverpod(keepAlive: true)
class LightDark extends _$LightDark {

  final String _key = 'theme_mode';

  @override
  FutureOr<ThemeMode> build() async {
    return await getTheme();
  }

  Future<ThemeMode> getTheme() async {
    final theme = await LocalStorage().getValue(_key);

    if(theme == 'dark') {
      return ThemeMode.dark;
    } else if(theme == 'light') {
      return ThemeMode.light;
    }
    return ThemeMode.system;
  }

  void setTheme(ThemeMode theme) {
    final stringValue = theme == ThemeMode.dark
        ? 'dark'
        : theme == ThemeMode.light
            ? 'light'
            : 'system';
    LocalStorage().setValue(_key, stringValue);
    state = AsyncValue.data(theme);
  }
}
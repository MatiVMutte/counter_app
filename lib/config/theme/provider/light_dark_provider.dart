
import 'package:flutter/material.dart';
import 'package:flutter_clean_app/config/utils/local_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'light_dark_provider.g.dart';

@Riverpod(keepAlive: true)
class LightDark extends _$LightDark {

  final String _key = 'theme_mode';

  @override
  FutureOr<ThemeMode> build() {
    return getTheme();
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
    LocalStorage().setValue(_key, theme.toString());
    state = AsyncValue.data(theme);
  }
}
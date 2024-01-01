import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorSchemeSeed: const Color(0xFF607274)
  );

  static final _darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorSchemeSeed: const Color(0xFFB2A59B),
  );

  void toggleTheme() {
    debugPrint('toggle');
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<ThemeMode> loadTheme() async{
  final preferences= await SharedPreferences.getInstance();
  final Darkmode = preferences.getBool('DarkMode') ?? false;
  return Darkmode ? ThemeMode.dark : ThemeMode.light;
}

Future<void> saveTheme(ThemeMode themeMode) async{
  final preferences = await SharedPreferences.getInstance();
  await preferences.setBool('DarkMode', themeMode == ThemeMode.dark);
}


final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeMode>{
  ThemeNotifier() : super(ThemeMode.light){
    _loadTheme();
  }

  //load currently theme
  Future<void> _loadTheme() async{
    state = await loadTheme();
  }

  void changeTheme() async{
    final newTheme = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    state= newTheme;
    await saveTheme(newTheme);
  }
}




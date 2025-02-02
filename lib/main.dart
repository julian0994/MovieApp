import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/data/providers/theme_provider.dart';
import 'package:movieapp/presentation/screens/splash.dart';
import 'presentation/screens/home.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()) );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final themeMode =ref.watch(themeProvider);

    return MaterialApp(

      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF424242),
        textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Color(0xFF000000)),
            bodySmall: TextStyle(color: Color(0xFF000000)),
            bodyMedium: TextStyle(color: Color(0xFF000000)),
        ),
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
        cardTheme: const CardTheme(
          color: Color(0xFFE0E0E0)
        ),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color:Color(0xFFF5F5F5) ),
          backgroundColor: Color(0xFF212121),
          titleTextStyle: TextStyle(
            fontSize: 18,
          )
        )
      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Color(0xFF424242),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Color(0xFFBDBDBD)),
            bodyLarge: TextStyle(color: Color(0xFFBDBDBD)),
            bodySmall: TextStyle(color: Color(0xFFBDBDBD)),
          ),
          scaffoldBackgroundColor: Color(0xFF181818),
          cardTheme: const CardTheme(
              color: Color(0xFF424242)
          ),
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color:Color(0xFFF5F5F5) ),
              backgroundColor: Color(0xFF000000),
              titleTextStyle: TextStyle(
                fontSize: 18,
              )
          )
      ),
      themeMode: themeMode,
      home: SplashScreen(),
    );
  }
}





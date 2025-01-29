import 'package:flutter/material.dart';
import 'package:watch_what/constans/favorite_series_provider.dart';
import 'package:watch_what/constans/watched_series_provider.dart';
import 'package:watch_what/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WatchedSeriesProvider()),
        ChangeNotifierProvider(create: (context) => FavoriteSeriesProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Watch What?',

      theme: ThemeData(
        
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:watch_what/provider/favorite_series_provider.dart';
import 'package:watch_what/provider/watched_series_provider.dart';
import 'package:watch_what/data/series_hive.dart';
import 'package:watch_what/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  
  // مقداردهی اولیه هایو
  await Hive.initFlutter();
  
  // ثبت آداپتور (اگر مدل سریال دارید)
  Hive.registerAdapter(SeriesAdapter()); 

  // باز کردن باکس‌های موردنیاز
  await Hive.openBox<HiveSeries>('watchedSeries');
  await Hive.openBox<HiveSeries>('favoriteSeries');
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

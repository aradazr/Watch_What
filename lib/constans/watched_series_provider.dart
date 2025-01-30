import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:watch_what/data/project_manager.dart';
import 'package:watch_what/data/series_hive.dart';

class WatchedSeriesProvider extends ChangeNotifier {
  final List<Series> _watchedSeries = [];
  late Box<HiveSeries> _watchedBox;

  List<Series> get watchedSeries => _watchedSeries;

  WatchedSeriesProvider() {
    _loadWatchedSeries();
  }

  /// 📌 **لود کردن سریال‌های دیده‌شده از Hive**
  void _loadWatchedSeries() async {
    _watchedBox = Hive.box<HiveSeries>('watchedSeries');
    _watchedSeries.clear();

    for (var item in _watchedBox.values) {
      _watchedSeries.add(
        Series(
        name: item.name,
        description: item.description,
        point: item.point,
        serialUrl: item.serialUrl,
        imagePath: item.imagePath,
      ));
    }
    notifyListeners();
  }

  /// 📌 **افزودن سریال به لیست دیده‌شده**
  void addToWatched(Series series) {
  // بررسی اینکه آیا این سریال قبلاً دیده شده یا خیر
  if (!_watchedSeries.contains(series)) { // استفاده از `name` برای مقایسه
    _watchedSeries.add(series); // اضافه کردن نام سریال به لیست دیده‌شده‌ها
    
    // ذخیره اطلاعات سریال در Hive با استفاده از HiveSeries
    _watchedBox.put(series.name, HiveSeries(
      name: series.name,
      description: series.description,
      point: series.point,
      serialUrl: series.serialUrl,
      imagePath: series.imagePath,
    ));
    
    // اطلاع‌رسانی به لیisteners
    notifyListeners();
  }
}

  /// 📌 **حذف سریال از لیست دیده‌شده**
  void removeFromWatched(Series series) {
    _watchedSeries.remove(series);
    _watchedBox.delete(series.name);
    notifyListeners();
  }

  /// 📌 **بررسی اینکه آیا سریال دیده شده است یا نه**
  bool isWatched(Series series) {
    return _watchedSeries.contains(series);
  }
}
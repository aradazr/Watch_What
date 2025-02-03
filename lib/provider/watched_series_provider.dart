import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:watch_what/data/project_manager.dart';
import 'package:watch_what/data/series_hive.dart';

class WatchedSeriesProvider extends ChangeNotifier {
  final List<Series> _watchedSeries = [];
  late Box<HiveSeries> _watchedBox;

  List<Series> get watchedSeries => List.unmodifiable(_watchedSeries);

  WatchedSeriesProvider() {
    _loadWatchedSeries();
  }

  /// 📌 **لود کردن سریال‌های دیده‌شده از Hive**
  Future<void> _loadWatchedSeries() async {
    _watchedBox = Hive.box<HiveSeries>('watchedSeries');
    _watchedSeries.clear();

    for (var item in _watchedBox.values) {
      _watchedSeries.add(Series(
        name: item.name,
        description: item.description,
        point: item.point,
        serialUrl: item.serialUrl,
        imagePath: item.imagePath,
      ));
    }
    notifyListeners();
  }

  /// 📌 **اضافه یا حذف سریال از لیست دیده‌شده**
  void toggleWatched(Series series) {
    final isAlreadyWatched = _watchedSeries.any((s) => s.name == series.name);

    if (isAlreadyWatched) {
      _watchedSeries.removeWhere((s) => s.name == series.name);
      _watchedBox.delete(series.name);
    } else {
      _watchedSeries.add(series);
      _watchedBox.put(series.name, HiveSeries(
        name: series.name,
        description: series.description,
        point: series.point,
        serialUrl: series.serialUrl,
        imagePath: series.imagePath,
      ));
    }

    notifyListeners();
  }

  /// 📌 **بررسی اینکه آیا سریال دیده شده است یا نه**
  bool isWatched(Series series) {
    return _watchedSeries.any((s) => s.name == series.name);
  }
}
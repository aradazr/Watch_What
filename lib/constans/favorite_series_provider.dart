import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:watch_what/data/project_manager.dart';
import 'package:watch_what/data/series_hive.dart';

class FavoriteSeriesProvider extends ChangeNotifier {
  final List<Series> _likedSeries = [];
  late Box<HiveSeries> _favoriteBox;

  List<Series> get likedSeries => _likedSeries;

  FavoriteSeriesProvider() {
    _loadLikedSeries();
  }

  /// 📌 **لود کردن سریال‌های لایک‌شده از Hive**
  void _loadLikedSeries() async {
    _favoriteBox = Hive.box<HiveSeries>('favoriteSeries');
    _likedSeries.clear();

    for (var item in _favoriteBox.values) {
      _likedSeries.add(Series(
        name: item.name,
        description: item.description,
        point: item.point,
        serialUrl: item.serialUrl,
        imagePath: item.imagePath,
      ));
    }
    notifyListeners();
  }

  /// 📌 **افزودن یا حذف از لیست لایک‌ها**
  void toggleLike(Series series) {
    if (_likedSeries.contains(series)) {
      _likedSeries.remove(series);
      _favoriteBox.delete(series.name); // حذف از Hive
    } else {
      _likedSeries.add(series);
      _favoriteBox.put(series.name, HiveSeries(
        name: series.name,
        description: series.description,
        point: series.point,
        serialUrl: series.serialUrl,
        imagePath: series.imagePath,
      )); // ذخیره در Hive
    }
    notifyListeners();
  }

  /// 📌 **بررسی اینکه آیا سریال لایک شده یا نه**
  bool isLiked(Series series) {
    return _likedSeries.contains(series);
  }

  /// 📌 **حذف سریال از لیست لایک‌شده‌ها**
  void removeLike(Series series) {
    _likedSeries.remove(series);
    _favoriteBox.delete(series.name);
    notifyListeners();
  }
}
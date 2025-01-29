import 'package:flutter/material.dart';
import 'package:watch_what/data/project_manager.dart';

class FavoriteSeriesProvider extends ChangeNotifier {
  final List<Series> _likedSeries = [];

  List<Series> get likedSeries => _likedSeries;

  void toggleLike(Series series) {
    if (_likedSeries.contains(series)) {
      _likedSeries.remove(series);
    } else {
      _likedSeries.add(series);
    }
    notifyListeners();
  }
  

  bool isLiked(Series series) {
    return _likedSeries.contains(series);
  }

  void removeLike(Series series) {
    likedSeries.remove(series);
    notifyListeners(); // اطلاع‌رسانی به تمامی ویجت‌هایی که به این داده‌ها نیاز دارند
  }

}
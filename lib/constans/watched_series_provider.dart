import 'package:flutter/material.dart';
import 'package:watch_what/data/project_data.dart';
import 'package:watch_what/data/project_manager.dart';

class WatchedSeriesProvider extends ChangeNotifier {
  final List<Series> _watchedSeries = [];

  List<Series> get watchedSeries => _watchedSeries;

  void addToWatched(Series series) {
    if (!_watchedSeries.contains(series)) {
      _watchedSeries.add(series);
      notifyListeners();
    }
  }

  void removeFromWatched(Series series) {
    _watchedSeries.remove(series);
    notifyListeners();
  }

  bool isWatched(Series series) {
    return _watchedSeries.contains(series);
  }
}
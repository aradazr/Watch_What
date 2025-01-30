import 'package:hive/hive.dart';

part 'series_hive.g.dart'; // این فایل بعداً با build_runner ساخته می‌شود

@HiveType(typeId: 0) // یک شناسه یکتا برای این کلاس
class HiveSeries {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String point;

  @HiveField(3)
  final String serialUrl;

  @HiveField(4)
  final String imagePath;

  HiveSeries({
    required this.name,
    required this.description,
    required this.point,
    required this.serialUrl,
    required this.imagePath,
  });
}

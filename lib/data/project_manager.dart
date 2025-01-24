
class Series {
  final String name;
  final String description;
  final String point;
  final String imagePath; // اضافه کردن رنگ‌های گرادیانت

  Series(
     {
    required this.name,
    required this.description,
    required this.imagePath, // اضافه کردن رنگ‌های گرادیانت در مدل
    required this.point,
  });
}
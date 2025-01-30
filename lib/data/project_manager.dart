
class Series {
  final String name;
  final String description;
  final String point;
  final String serialUrl;
  final String imagePath; // اضافه کردن رنگ‌های گرادیانت

  Series(
     {
    required this.name,
    required this.description,
    required this.imagePath, // اضافه کردن رنگ‌های گرادیانت در مدل
    required this.point,
    required this.serialUrl
  });
    @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Series && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
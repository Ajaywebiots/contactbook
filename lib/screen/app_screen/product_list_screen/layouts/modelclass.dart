class Product {
  String imageUrl;
  String name;
  List<String> size;
  bool isSizeSelected;
  List<String> color;
  bool isColorSelected;
  int price;

  Product({
    required this.imageUrl,
    required this.name,
    required this.size,
    required this.isSizeSelected,
    required this.color,
    required this.isColorSelected,
    required this.price,
  });
}

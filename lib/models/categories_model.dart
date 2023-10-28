class Category {
  final int id;
  final String name;

  Category(this.id, this.name);

  // Convert a Map to a Category object
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      json['id'] as int,
      json['name'] as String,
    );
  }

  // Convert a Category object to a Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

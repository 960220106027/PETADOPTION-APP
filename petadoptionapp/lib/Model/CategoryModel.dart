class Categories {
  final String id;
  final String name;
  final String photo;

  Categories({required this.id, required this.name, required this.photo});

  factory Categories.fromJson(Map<String, dynamic> json) {
   return Categories(
     id : json['id'],
    name : json['name'],
    photo : json['photo'],
   );
  }
}
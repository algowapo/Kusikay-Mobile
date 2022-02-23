class Benefit {
  int? id;
  String? name;
  String? description;
  String? imagenUrl;

  Benefit({this.id, this.name, this.imagenUrl, this.description});

  factory Benefit.fromJson(Map<dynamic, dynamic> json) {
    return Benefit(
        id: json['id'],
        name: json['name'],
        imagenUrl: json['imageUrl'],
        description: json['description']);
  }
}

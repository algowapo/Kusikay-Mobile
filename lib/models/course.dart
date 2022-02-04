class Course {
  int? id;
  String? name;

  Course(
      {this.id,
        this.name,
        });

  factory Course.fromJson(Map<dynamic, dynamic> json) {
    return Course(
        id: json['id'],
        name: json['name']
    );
  }
}

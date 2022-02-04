import 'package:kusikay_mobile/utils/util.dart';

class Teacher {
  int? id;
  String? name;
  String? DNI;
  String? phone;
  int? age;
  String? field;


  Teacher(
      {this.id,
        this.name,
        this.DNI,
        this.phone,
        this.age,
        this.field});

  factory Teacher.fromJson(Map<dynamic, dynamic> json) {
    return Teacher(
        id: json['id'],
        name: json['name'],
        DNI: json['DNI'],
        phone: json['phone'],
        age:  json['age'],
        field: json['field'],
    );
  }
}

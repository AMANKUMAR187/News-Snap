

import 'dart:convert';

class Note{
  final String id;
  final String user_id;
  final String headline;
  final String des;
  final String date;
  Note({
    required this.id,
    required this.user_id,
    required this.headline,
    required this.des,
    required this.date
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id':user_id ,
      'headline': headline,
      'des': des,
      'date' : date,

    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['_id'] ?? '',
      user_id: map['user_id'] ?? '',
      headline: map['headline'] ?? '',
      des: map['des'] ?? '',
      date: map['date'] ?? '',

    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));

  Note copyWith({
    String? id,
    String? user_id,
    String? headline,
    String? des,
    String? date,

  }) {
    return Note(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      headline: headline ?? this.headline,
      des: des ?? this.des,
      date: date ?? this.date,

    );
  }
}

// To parse this JSON data, do
//
//     final gener = generFromJson(jsonString);

import 'dart:convert';

Gener generFromJson(String str) => Gener.fromJson(json.decode(str));

String generToJson(Gener data) => json.encode(data.toJson());

class Gener {
  List<Genre> genres;

  Gener({
    this.genres,
  });

  factory Gener.fromJson(Map<String, dynamic> json) => Gener(
    genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
  };
}

class Genre {
  int id;
  String name;

  Genre({
    this.id,
    this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

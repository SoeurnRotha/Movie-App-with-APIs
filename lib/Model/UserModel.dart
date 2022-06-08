// To parse this JSON data, do
//
//     final movieModel = movieModelFromMap(jsonString);

import 'dart:convert';

MovieModel movieModelFromMap(String str) => MovieModel.fromMap(json.decode(str));

String movieModelToMap(MovieModel data) => json.encode(data.toMap());

class MovieModel {
  MovieModel({
    this.search = const[],
    this.totalResults = "",
    this.response = "",
  });

  List<Search> search;
  String totalResults;
  String response;

  factory MovieModel.fromMap(Map<String, dynamic> json) => MovieModel(
    search: List<Search>.from(json["Search"].map((x) => Search.fromMap(x))),
    totalResults: json["totalResults"],
    response: json["Response"],
  );

  Map<String, dynamic> toMap() => {
    "Search": List<dynamic>.from(search.map((x) => x.toMap())),
    "totalResults": totalResults,
    "Response": response,
  };
}

class Search {
  Search({
    this.title = "",
    this.year = "",
    this.imdbId = "",
    this.type ="",
    this.poster = "",
  });

  String title;
  String year;
  String imdbId;
  String type;
  String poster;

  factory Search.fromMap(Map<String, dynamic> json) => Search(
    title: json["Title"],
    year: json["Year"],
    imdbId: json["imdbID"],
    type: json["Type"],
    poster: json["Poster"],
  );

  Map<String, dynamic> toMap() => {
    "Title": title,
    "Year": year,
    "imdbID": imdbId,
    "Type": type,
    "Poster": poster,
  };
}

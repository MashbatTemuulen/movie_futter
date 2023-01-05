import "package:json_annotation/json_annotation.dart";

part 'index.g.dart';

@JsonSerializable()
class MovieModel {
  int id;
  String imgUrl, title;
  String? publishedYear, durationMin;
  String? type, description;

  MovieModel(
      {required this.id,
      required this.title,
      required this.imgUrl,
      this.type,
      this.description,
      this.durationMin,
      this.publishedYear});

  static List<MovieModel> fromList(List<dynamic> data) =>
      data.map((el) => MovieModel.fromJson(el)).toList();

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  /// Connect the generated [_$MovieModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}

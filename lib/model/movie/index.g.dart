// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      id: json['id'] as int,
      title: json['title'] as String,
      imgUrl: json['imgUrl'] as String,
      type: json['type'] as String?,
      description: json['description'] as String?,
      durationMin: json['durationMin'] as String?,
      publishedYear: json['publishedYear'] as String?,
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imgUrl': instance.imgUrl,
      'title': instance.title,
      'publishedYear': instance.publishedYear,
      'durationMin': instance.durationMin,
      'type': instance.type,
      'description': instance.description,
    };
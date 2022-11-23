// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutorial_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TutorialModel _$$_TutorialModelFromJson(Map<String, dynamic> json) =>
    _$_TutorialModel(
      videoLink: json['videoLink'] as String,
      title: json['title'] as String,
      rounds: json['rounds'] as int? ?? 1,
      thumbnail: json['thumbnail'] as String,
    );

Map<String, dynamic> _$$_TutorialModelToJson(_$_TutorialModel instance) =>
    <String, dynamic>{
      'videoLink': instance.videoLink,
      'title': instance.title,
      'rounds': instance.rounds,
      'thumbnail': instance.thumbnail,
    };

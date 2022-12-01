import 'package:freezed_annotation/freezed_annotation.dart';
part 'tutorial_model.freezed.dart';
part 'tutorial_model.g.dart';

@freezed
class TutorialModel with _$TutorialModel {
  const factory TutorialModel({
    required String videoLink,
    required String title,
    required String time,
    @Default(1) int rounds,
    required String thumbnail,
  }) = _TutorialModel;
  factory TutorialModel.fromJson(Map<String, dynamic> json) =>
      _$TutorialModelFromJson(json);
}

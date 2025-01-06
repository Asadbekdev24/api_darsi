import 'package:api_darsi/utils/typedefs/typedefs.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  final int id;
  final String title;
  @JsonKey(name: "userId")
  final int userId;
  final String body;

  const PostModel({
    required this.id,
    required this.title,
    required this.userId,
    required this.body,
  });

  factory PostModel.fromJson(DataMap json) => _$PostModelFromJson(json);

  DataMap toJson() => _$PostModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'flavours_model.g.dart';

@JsonSerializable()
class FlavourModel {
  @JsonKey(name: "data")
  final List<FlavourData>? data;
  @JsonKey(name: "pagination")
  final Pagination? pagination;

  FlavourModel({
    this.data,
    this.pagination,
  });

  factory FlavourModel.fromJson(Map<String, dynamic> json) =>
      _$FlavourModelFromJson(json);

  Map<String, dynamic> toJson() => _$FlavourModelToJson(this);
}

@JsonSerializable()
class FlavourData {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;

  FlavourData({
    this.id,
    this.name,
  });

  factory FlavourData.fromJson(Map<String, dynamic> json) =>
      _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class Pagination {
  @JsonKey(name: "total_records")
  final int? totalRecords;
  @JsonKey(name: "current_page")
  final int? currentPage;
  @JsonKey(name: "total_pages")
  final int? totalPages;
  @JsonKey(name: "next_page")
  final dynamic nextPage;
  @JsonKey(name: "prev_page")
  final dynamic prevPage;

  Pagination({
    this.totalRecords,
    this.currentPage,
    this.totalPages,
    this.nextPage,
    this.prevPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

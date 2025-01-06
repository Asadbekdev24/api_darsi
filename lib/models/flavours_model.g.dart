// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flavours_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlavourModel _$FlavourModelFromJson(Map<String, dynamic> json) => FlavourModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FlavourData.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FlavourModelToJson(FlavourModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'pagination': instance.pagination,
    };

FlavourData _$DatumFromJson(Map<String, dynamic> json) => FlavourData(
      id: json['_id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DatumToJson(FlavourData instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      totalRecords: (json['total_records'] as num?)?.toInt(),
      currentPage: (json['current_page'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      nextPage: json['next_page'],
      prevPage: json['prev_page'],
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'total_records': instance.totalRecords,
      'current_page': instance.currentPage,
      'total_pages': instance.totalPages,
      'next_page': instance.nextPage,
      'prev_page': instance.prevPage,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotesStateImpl _$$NotesStateImplFromJson(Map<String, dynamic> json) =>
    _$NotesStateImpl(
      notes: (json['notes'] as List<dynamic>)
          .map((e) => Note.fromJson(e as Map<String, dynamic>))
          .toList(),
      sortType: $enumDecodeNullable(_$NoteSortTypeEnumMap, json['sortType']) ??
          NoteSortType.dateDesc,
    );

Map<String, dynamic> _$$NotesStateImplToJson(_$NotesStateImpl instance) =>
    <String, dynamic>{
      'notes': instance.notes,
      'sortType': _$NoteSortTypeEnumMap[instance.sortType]!,
    };

const _$NoteSortTypeEnumMap = {
  NoteSortType.dateDesc: 'dateDesc',
  NoteSortType.dateAsc: 'dateAsc',
  NoteSortType.titleAsc: 'titleAsc',
  NoteSortType.colorAsc: 'colorAsc',
};

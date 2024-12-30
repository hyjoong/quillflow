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
    );

Map<String, dynamic> _$$NotesStateImplToJson(_$NotesStateImpl instance) =>
    <String, dynamic>{
      'notes': instance.notes,
    };

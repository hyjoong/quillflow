import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'note.freezed.dart';
part 'note.g.dart';

@freezed
class Note with _$Note {
  const factory Note({
    required String title,
    required String content,
    required int color,
    required int timestamp,
    int? id,
  }) = _Note;

  factory Note.fromJson(Map<String, Object?> json) => _$NoteFromJson(json);
}

extension NoteX on Note {
  int getNormalizedTimestamp() {
    if (timestamp.toString().length > 13) {
      return (timestamp / 1000).round();
    } else if (timestamp.toString().length < 13) {
      return timestamp * 1000;
    }
    return timestamp;
  }
}

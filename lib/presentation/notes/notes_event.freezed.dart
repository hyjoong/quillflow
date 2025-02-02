// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notes_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadNotes,
    required TResult Function(Note note) deleteNote,
    required TResult Function() restoreNote,
    required TResult Function(NoteSortType sortType) changeSort,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadNotes,
    TResult? Function(Note note)? deleteNote,
    TResult? Function()? restoreNote,
    TResult? Function(NoteSortType sortType)? changeSort,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadNotes,
    TResult Function(Note note)? deleteNote,
    TResult Function()? restoreNote,
    TResult Function(NoteSortType sortType)? changeSort,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadNotes value) loadNotes,
    required TResult Function(DeleteNote value) deleteNote,
    required TResult Function(RestoreNote value) restoreNote,
    required TResult Function(ChangeSort value) changeSort,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadNotes value)? loadNotes,
    TResult? Function(DeleteNote value)? deleteNote,
    TResult? Function(RestoreNote value)? restoreNote,
    TResult? Function(ChangeSort value)? changeSort,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadNotes value)? loadNotes,
    TResult Function(DeleteNote value)? deleteNote,
    TResult Function(RestoreNote value)? restoreNote,
    TResult Function(ChangeSort value)? changeSort,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesEventCopyWith<$Res> {
  factory $NotesEventCopyWith(
          NotesEvent value, $Res Function(NotesEvent) then) =
      _$NotesEventCopyWithImpl<$Res, NotesEvent>;
}

/// @nodoc
class _$NotesEventCopyWithImpl<$Res, $Val extends NotesEvent>
    implements $NotesEventCopyWith<$Res> {
  _$NotesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadNotesImplCopyWith<$Res> {
  factory _$$LoadNotesImplCopyWith(
          _$LoadNotesImpl value, $Res Function(_$LoadNotesImpl) then) =
      __$$LoadNotesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadNotesImplCopyWithImpl<$Res>
    extends _$NotesEventCopyWithImpl<$Res, _$LoadNotesImpl>
    implements _$$LoadNotesImplCopyWith<$Res> {
  __$$LoadNotesImplCopyWithImpl(
      _$LoadNotesImpl _value, $Res Function(_$LoadNotesImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadNotesImpl implements LoadNotes {
  const _$LoadNotesImpl();

  @override
  String toString() {
    return 'NotesEvent.loadNotes()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadNotesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadNotes,
    required TResult Function(Note note) deleteNote,
    required TResult Function() restoreNote,
    required TResult Function(NoteSortType sortType) changeSort,
  }) {
    return loadNotes();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadNotes,
    TResult? Function(Note note)? deleteNote,
    TResult? Function()? restoreNote,
    TResult? Function(NoteSortType sortType)? changeSort,
  }) {
    return loadNotes?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadNotes,
    TResult Function(Note note)? deleteNote,
    TResult Function()? restoreNote,
    TResult Function(NoteSortType sortType)? changeSort,
    required TResult orElse(),
  }) {
    if (loadNotes != null) {
      return loadNotes();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadNotes value) loadNotes,
    required TResult Function(DeleteNote value) deleteNote,
    required TResult Function(RestoreNote value) restoreNote,
    required TResult Function(ChangeSort value) changeSort,
  }) {
    return loadNotes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadNotes value)? loadNotes,
    TResult? Function(DeleteNote value)? deleteNote,
    TResult? Function(RestoreNote value)? restoreNote,
    TResult? Function(ChangeSort value)? changeSort,
  }) {
    return loadNotes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadNotes value)? loadNotes,
    TResult Function(DeleteNote value)? deleteNote,
    TResult Function(RestoreNote value)? restoreNote,
    TResult Function(ChangeSort value)? changeSort,
    required TResult orElse(),
  }) {
    if (loadNotes != null) {
      return loadNotes(this);
    }
    return orElse();
  }
}

abstract class LoadNotes implements NotesEvent {
  const factory LoadNotes() = _$LoadNotesImpl;
}

/// @nodoc
abstract class _$$DeleteNoteImplCopyWith<$Res> {
  factory _$$DeleteNoteImplCopyWith(
          _$DeleteNoteImpl value, $Res Function(_$DeleteNoteImpl) then) =
      __$$DeleteNoteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Note note});

  $NoteCopyWith<$Res> get note;
}

/// @nodoc
class __$$DeleteNoteImplCopyWithImpl<$Res>
    extends _$NotesEventCopyWithImpl<$Res, _$DeleteNoteImpl>
    implements _$$DeleteNoteImplCopyWith<$Res> {
  __$$DeleteNoteImplCopyWithImpl(
      _$DeleteNoteImpl _value, $Res Function(_$DeleteNoteImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? note = null,
  }) {
    return _then(_$DeleteNoteImpl(
      null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note,
    ));
  }

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NoteCopyWith<$Res> get note {
    return $NoteCopyWith<$Res>(_value.note, (value) {
      return _then(_value.copyWith(note: value));
    });
  }
}

/// @nodoc

class _$DeleteNoteImpl implements DeleteNote {
  const _$DeleteNoteImpl(this.note);

  @override
  final Note note;

  @override
  String toString() {
    return 'NotesEvent.deleteNote(note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteNoteImpl &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, note);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteNoteImplCopyWith<_$DeleteNoteImpl> get copyWith =>
      __$$DeleteNoteImplCopyWithImpl<_$DeleteNoteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadNotes,
    required TResult Function(Note note) deleteNote,
    required TResult Function() restoreNote,
    required TResult Function(NoteSortType sortType) changeSort,
  }) {
    return deleteNote(note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadNotes,
    TResult? Function(Note note)? deleteNote,
    TResult? Function()? restoreNote,
    TResult? Function(NoteSortType sortType)? changeSort,
  }) {
    return deleteNote?.call(note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadNotes,
    TResult Function(Note note)? deleteNote,
    TResult Function()? restoreNote,
    TResult Function(NoteSortType sortType)? changeSort,
    required TResult orElse(),
  }) {
    if (deleteNote != null) {
      return deleteNote(note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadNotes value) loadNotes,
    required TResult Function(DeleteNote value) deleteNote,
    required TResult Function(RestoreNote value) restoreNote,
    required TResult Function(ChangeSort value) changeSort,
  }) {
    return deleteNote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadNotes value)? loadNotes,
    TResult? Function(DeleteNote value)? deleteNote,
    TResult? Function(RestoreNote value)? restoreNote,
    TResult? Function(ChangeSort value)? changeSort,
  }) {
    return deleteNote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadNotes value)? loadNotes,
    TResult Function(DeleteNote value)? deleteNote,
    TResult Function(RestoreNote value)? restoreNote,
    TResult Function(ChangeSort value)? changeSort,
    required TResult orElse(),
  }) {
    if (deleteNote != null) {
      return deleteNote(this);
    }
    return orElse();
  }
}

abstract class DeleteNote implements NotesEvent {
  const factory DeleteNote(final Note note) = _$DeleteNoteImpl;

  Note get note;

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteNoteImplCopyWith<_$DeleteNoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RestoreNoteImplCopyWith<$Res> {
  factory _$$RestoreNoteImplCopyWith(
          _$RestoreNoteImpl value, $Res Function(_$RestoreNoteImpl) then) =
      __$$RestoreNoteImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RestoreNoteImplCopyWithImpl<$Res>
    extends _$NotesEventCopyWithImpl<$Res, _$RestoreNoteImpl>
    implements _$$RestoreNoteImplCopyWith<$Res> {
  __$$RestoreNoteImplCopyWithImpl(
      _$RestoreNoteImpl _value, $Res Function(_$RestoreNoteImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RestoreNoteImpl implements RestoreNote {
  const _$RestoreNoteImpl();

  @override
  String toString() {
    return 'NotesEvent.restoreNote()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RestoreNoteImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadNotes,
    required TResult Function(Note note) deleteNote,
    required TResult Function() restoreNote,
    required TResult Function(NoteSortType sortType) changeSort,
  }) {
    return restoreNote();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadNotes,
    TResult? Function(Note note)? deleteNote,
    TResult? Function()? restoreNote,
    TResult? Function(NoteSortType sortType)? changeSort,
  }) {
    return restoreNote?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadNotes,
    TResult Function(Note note)? deleteNote,
    TResult Function()? restoreNote,
    TResult Function(NoteSortType sortType)? changeSort,
    required TResult orElse(),
  }) {
    if (restoreNote != null) {
      return restoreNote();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadNotes value) loadNotes,
    required TResult Function(DeleteNote value) deleteNote,
    required TResult Function(RestoreNote value) restoreNote,
    required TResult Function(ChangeSort value) changeSort,
  }) {
    return restoreNote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadNotes value)? loadNotes,
    TResult? Function(DeleteNote value)? deleteNote,
    TResult? Function(RestoreNote value)? restoreNote,
    TResult? Function(ChangeSort value)? changeSort,
  }) {
    return restoreNote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadNotes value)? loadNotes,
    TResult Function(DeleteNote value)? deleteNote,
    TResult Function(RestoreNote value)? restoreNote,
    TResult Function(ChangeSort value)? changeSort,
    required TResult orElse(),
  }) {
    if (restoreNote != null) {
      return restoreNote(this);
    }
    return orElse();
  }
}

abstract class RestoreNote implements NotesEvent {
  const factory RestoreNote() = _$RestoreNoteImpl;
}

/// @nodoc
abstract class _$$ChangeSortImplCopyWith<$Res> {
  factory _$$ChangeSortImplCopyWith(
          _$ChangeSortImpl value, $Res Function(_$ChangeSortImpl) then) =
      __$$ChangeSortImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NoteSortType sortType});
}

/// @nodoc
class __$$ChangeSortImplCopyWithImpl<$Res>
    extends _$NotesEventCopyWithImpl<$Res, _$ChangeSortImpl>
    implements _$$ChangeSortImplCopyWith<$Res> {
  __$$ChangeSortImplCopyWithImpl(
      _$ChangeSortImpl _value, $Res Function(_$ChangeSortImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortType = null,
  }) {
    return _then(_$ChangeSortImpl(
      null == sortType
          ? _value.sortType
          : sortType // ignore: cast_nullable_to_non_nullable
              as NoteSortType,
    ));
  }
}

/// @nodoc

class _$ChangeSortImpl implements ChangeSort {
  const _$ChangeSortImpl(this.sortType);

  @override
  final NoteSortType sortType;

  @override
  String toString() {
    return 'NotesEvent.changeSort(sortType: $sortType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeSortImpl &&
            (identical(other.sortType, sortType) ||
                other.sortType == sortType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sortType);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeSortImplCopyWith<_$ChangeSortImpl> get copyWith =>
      __$$ChangeSortImplCopyWithImpl<_$ChangeSortImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadNotes,
    required TResult Function(Note note) deleteNote,
    required TResult Function() restoreNote,
    required TResult Function(NoteSortType sortType) changeSort,
  }) {
    return changeSort(sortType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadNotes,
    TResult? Function(Note note)? deleteNote,
    TResult? Function()? restoreNote,
    TResult? Function(NoteSortType sortType)? changeSort,
  }) {
    return changeSort?.call(sortType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadNotes,
    TResult Function(Note note)? deleteNote,
    TResult Function()? restoreNote,
    TResult Function(NoteSortType sortType)? changeSort,
    required TResult orElse(),
  }) {
    if (changeSort != null) {
      return changeSort(sortType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadNotes value) loadNotes,
    required TResult Function(DeleteNote value) deleteNote,
    required TResult Function(RestoreNote value) restoreNote,
    required TResult Function(ChangeSort value) changeSort,
  }) {
    return changeSort(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadNotes value)? loadNotes,
    TResult? Function(DeleteNote value)? deleteNote,
    TResult? Function(RestoreNote value)? restoreNote,
    TResult? Function(ChangeSort value)? changeSort,
  }) {
    return changeSort?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadNotes value)? loadNotes,
    TResult Function(DeleteNote value)? deleteNote,
    TResult Function(RestoreNote value)? restoreNote,
    TResult Function(ChangeSort value)? changeSort,
    required TResult orElse(),
  }) {
    if (changeSort != null) {
      return changeSort(this);
    }
    return orElse();
  }
}

abstract class ChangeSort implements NotesEvent {
  const factory ChangeSort(final NoteSortType sortType) = _$ChangeSortImpl;

  NoteSortType get sortType;

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeSortImplCopyWith<_$ChangeSortImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

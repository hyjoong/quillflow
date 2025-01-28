// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_edit_note_ui_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddEditNoteUiEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() saveNote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? saveNote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? saveNote,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SaveNote value) saveNote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SaveNote value)? saveNote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveNote value)? saveNote,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddEditNoteUiEventCopyWith<$Res> {
  factory $AddEditNoteUiEventCopyWith(
          AddEditNoteUiEvent value, $Res Function(AddEditNoteUiEvent) then) =
      _$AddEditNoteUiEventCopyWithImpl<$Res, AddEditNoteUiEvent>;
}

/// @nodoc
class _$AddEditNoteUiEventCopyWithImpl<$Res, $Val extends AddEditNoteUiEvent>
    implements $AddEditNoteUiEventCopyWith<$Res> {
  _$AddEditNoteUiEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddEditNoteUiEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SaveNoteImplCopyWith<$Res> {
  factory _$$SaveNoteImplCopyWith(
          _$SaveNoteImpl value, $Res Function(_$SaveNoteImpl) then) =
      __$$SaveNoteImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SaveNoteImplCopyWithImpl<$Res>
    extends _$AddEditNoteUiEventCopyWithImpl<$Res, _$SaveNoteImpl>
    implements _$$SaveNoteImplCopyWith<$Res> {
  __$$SaveNoteImplCopyWithImpl(
      _$SaveNoteImpl _value, $Res Function(_$SaveNoteImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddEditNoteUiEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SaveNoteImpl implements SaveNote {
  const _$SaveNoteImpl();

  @override
  String toString() {
    return 'AddEditNoteUiEvent.saveNote()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SaveNoteImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() saveNote,
  }) {
    return saveNote();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? saveNote,
  }) {
    return saveNote?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? saveNote,
    required TResult orElse(),
  }) {
    if (saveNote != null) {
      return saveNote();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SaveNote value) saveNote,
  }) {
    return saveNote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SaveNote value)? saveNote,
  }) {
    return saveNote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveNote value)? saveNote,
    required TResult orElse(),
  }) {
    if (saveNote != null) {
      return saveNote(this);
    }
    return orElse();
  }
}

abstract class SaveNote implements AddEditNoteUiEvent {
  const factory SaveNote() = _$SaveNoteImpl;
}

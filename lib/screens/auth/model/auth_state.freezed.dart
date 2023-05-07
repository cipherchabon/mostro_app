// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  AuthFormState get form => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthFormState form) initial,
    required TResult Function(AuthFormState form) submitting,
    required TResult Function(AuthFormState form) success,
    required TResult Function(AuthFormState form, String e) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthFormState form)? initial,
    TResult? Function(AuthFormState form)? submitting,
    TResult? Function(AuthFormState form)? success,
    TResult? Function(AuthFormState form, String e)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthFormState form)? initial,
    TResult Function(AuthFormState form)? submitting,
    TResult Function(AuthFormState form)? success,
    TResult Function(AuthFormState form, String e)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Submitting value)? submitting,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call({AuthFormState form});

  $AuthFormStateCopyWith<$Res> get form;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
  }) {
    return _then(_value.copyWith(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as AuthFormState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthFormStateCopyWith<$Res> get form {
    return $AuthFormStateCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthFormState form});

  @override
  $AuthFormStateCopyWith<$Res> get form;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
  }) {
    return _then(_$_Initial(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as AuthFormState,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  _$_Initial({this.form = const AuthFormState()});

  @override
  @JsonKey()
  final AuthFormState form;

  @override
  String toString() {
    return 'AuthState.initial(form: $form)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.form, form) || other.form == form));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthFormState form) initial,
    required TResult Function(AuthFormState form) submitting,
    required TResult Function(AuthFormState form) success,
    required TResult Function(AuthFormState form, String e) failure,
  }) {
    return initial(form);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthFormState form)? initial,
    TResult? Function(AuthFormState form)? submitting,
    TResult? Function(AuthFormState form)? success,
    TResult? Function(AuthFormState form, String e)? failure,
  }) {
    return initial?.call(form);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthFormState form)? initial,
    TResult Function(AuthFormState form)? submitting,
    TResult Function(AuthFormState form)? success,
    TResult Function(AuthFormState form, String e)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(form);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Submitting value)? submitting,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  factory _Initial({final AuthFormState form}) = _$_Initial;

  @override
  AuthFormState get form;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SubmittingCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$_SubmittingCopyWith(
          _$_Submitting value, $Res Function(_$_Submitting) then) =
      __$$_SubmittingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthFormState form});

  @override
  $AuthFormStateCopyWith<$Res> get form;
}

/// @nodoc
class __$$_SubmittingCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_Submitting>
    implements _$$_SubmittingCopyWith<$Res> {
  __$$_SubmittingCopyWithImpl(
      _$_Submitting _value, $Res Function(_$_Submitting) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
  }) {
    return _then(_$_Submitting(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as AuthFormState,
    ));
  }
}

/// @nodoc

class _$_Submitting implements _Submitting {
  _$_Submitting({this.form = const AuthFormState()});

  @override
  @JsonKey()
  final AuthFormState form;

  @override
  String toString() {
    return 'AuthState.submitting(form: $form)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Submitting &&
            (identical(other.form, form) || other.form == form));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmittingCopyWith<_$_Submitting> get copyWith =>
      __$$_SubmittingCopyWithImpl<_$_Submitting>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthFormState form) initial,
    required TResult Function(AuthFormState form) submitting,
    required TResult Function(AuthFormState form) success,
    required TResult Function(AuthFormState form, String e) failure,
  }) {
    return submitting(form);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthFormState form)? initial,
    TResult? Function(AuthFormState form)? submitting,
    TResult? Function(AuthFormState form)? success,
    TResult? Function(AuthFormState form, String e)? failure,
  }) {
    return submitting?.call(form);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthFormState form)? initial,
    TResult Function(AuthFormState form)? submitting,
    TResult Function(AuthFormState form)? success,
    TResult Function(AuthFormState form, String e)? failure,
    required TResult orElse(),
  }) {
    if (submitting != null) {
      return submitting(form);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return submitting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Submitting value)? submitting,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return submitting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (submitting != null) {
      return submitting(this);
    }
    return orElse();
  }
}

abstract class _Submitting implements AuthState {
  factory _Submitting({final AuthFormState form}) = _$_Submitting;

  @override
  AuthFormState get form;
  @override
  @JsonKey(ignore: true)
  _$$_SubmittingCopyWith<_$_Submitting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthFormState form});

  @override
  $AuthFormStateCopyWith<$Res> get form;
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
  }) {
    return _then(_$_Success(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as AuthFormState,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  _$_Success({this.form = const AuthFormState()});

  @override
  @JsonKey()
  final AuthFormState form;

  @override
  String toString() {
    return 'AuthState.success(form: $form)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            (identical(other.form, form) || other.form == form));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      __$$_SuccessCopyWithImpl<_$_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthFormState form) initial,
    required TResult Function(AuthFormState form) submitting,
    required TResult Function(AuthFormState form) success,
    required TResult Function(AuthFormState form, String e) failure,
  }) {
    return success(form);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthFormState form)? initial,
    TResult? Function(AuthFormState form)? submitting,
    TResult? Function(AuthFormState form)? success,
    TResult? Function(AuthFormState form, String e)? failure,
  }) {
    return success?.call(form);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthFormState form)? initial,
    TResult Function(AuthFormState form)? submitting,
    TResult Function(AuthFormState form)? success,
    TResult Function(AuthFormState form, String e)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(form);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Submitting value)? submitting,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements AuthState {
  factory _Success({final AuthFormState form}) = _$_Success;

  @override
  AuthFormState get form;
  @override
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FailureCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$_FailureCopyWith(
          _$_Failure value, $Res Function(_$_Failure) then) =
      __$$_FailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthFormState form, String e});

  @override
  $AuthFormStateCopyWith<$Res> get form;
}

/// @nodoc
class __$$_FailureCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_Failure>
    implements _$$_FailureCopyWith<$Res> {
  __$$_FailureCopyWithImpl(_$_Failure _value, $Res Function(_$_Failure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? e = null,
  }) {
    return _then(_$_Failure(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as AuthFormState,
      e: null == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Failure implements _Failure {
  _$_Failure({this.form = const AuthFormState(), required this.e});

  @override
  @JsonKey()
  final AuthFormState form;
  @override
  final String e;

  @override
  String toString() {
    return 'AuthState.failure(form: $form, e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Failure &&
            (identical(other.form, form) || other.form == form) &&
            (identical(other.e, e) || other.e == e));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form, e);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      __$$_FailureCopyWithImpl<_$_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthFormState form) initial,
    required TResult Function(AuthFormState form) submitting,
    required TResult Function(AuthFormState form) success,
    required TResult Function(AuthFormState form, String e) failure,
  }) {
    return failure(form, e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthFormState form)? initial,
    TResult? Function(AuthFormState form)? submitting,
    TResult? Function(AuthFormState form)? success,
    TResult? Function(AuthFormState form, String e)? failure,
  }) {
    return failure?.call(form, e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthFormState form)? initial,
    TResult Function(AuthFormState form)? submitting,
    TResult Function(AuthFormState form)? success,
    TResult Function(AuthFormState form, String e)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(form, e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Submitting value)? submitting,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements AuthState {
  factory _Failure({final AuthFormState form, required final String e}) =
      _$_Failure;

  @override
  AuthFormState get form;
  String get e;
  @override
  @JsonKey(ignore: true)
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      throw _privateConstructorUsedError;
}

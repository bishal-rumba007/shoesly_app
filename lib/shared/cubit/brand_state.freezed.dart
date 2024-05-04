// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brand_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BrandState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Brand> brands) loaded,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Brand> brands)? loaded,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Brand> brands)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BrandInitialState value) initial,
    required TResult Function(BrandLoadingState value) loading,
    required TResult Function(BrandLoadedState value) loaded,
    required TResult Function(BrandErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BrandInitialState value)? initial,
    TResult? Function(BrandLoadingState value)? loading,
    TResult? Function(BrandLoadedState value)? loaded,
    TResult? Function(BrandErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BrandInitialState value)? initial,
    TResult Function(BrandLoadingState value)? loading,
    TResult Function(BrandLoadedState value)? loaded,
    TResult Function(BrandErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandStateCopyWith<$Res> {
  factory $BrandStateCopyWith(
          BrandState value, $Res Function(BrandState) then) =
      _$BrandStateCopyWithImpl<$Res, BrandState>;
}

/// @nodoc
class _$BrandStateCopyWithImpl<$Res, $Val extends BrandState>
    implements $BrandStateCopyWith<$Res> {
  _$BrandStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$BrandInitialStateImplCopyWith<$Res> {
  factory _$$BrandInitialStateImplCopyWith(_$BrandInitialStateImpl value,
          $Res Function(_$BrandInitialStateImpl) then) =
      __$$BrandInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BrandInitialStateImplCopyWithImpl<$Res>
    extends _$BrandStateCopyWithImpl<$Res, _$BrandInitialStateImpl>
    implements _$$BrandInitialStateImplCopyWith<$Res> {
  __$$BrandInitialStateImplCopyWithImpl(_$BrandInitialStateImpl _value,
      $Res Function(_$BrandInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BrandInitialStateImpl implements BrandInitialState {
  const _$BrandInitialStateImpl();

  @override
  String toString() {
    return 'BrandState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BrandInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Brand> brands) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Brand> brands)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Brand> brands)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BrandInitialState value) initial,
    required TResult Function(BrandLoadingState value) loading,
    required TResult Function(BrandLoadedState value) loaded,
    required TResult Function(BrandErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BrandInitialState value)? initial,
    TResult? Function(BrandLoadingState value)? loading,
    TResult? Function(BrandLoadedState value)? loaded,
    TResult? Function(BrandErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BrandInitialState value)? initial,
    TResult Function(BrandLoadingState value)? loading,
    TResult Function(BrandLoadedState value)? loaded,
    TResult Function(BrandErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class BrandInitialState implements BrandState {
  const factory BrandInitialState() = _$BrandInitialStateImpl;
}

/// @nodoc
abstract class _$$BrandLoadingStateImplCopyWith<$Res> {
  factory _$$BrandLoadingStateImplCopyWith(_$BrandLoadingStateImpl value,
          $Res Function(_$BrandLoadingStateImpl) then) =
      __$$BrandLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BrandLoadingStateImplCopyWithImpl<$Res>
    extends _$BrandStateCopyWithImpl<$Res, _$BrandLoadingStateImpl>
    implements _$$BrandLoadingStateImplCopyWith<$Res> {
  __$$BrandLoadingStateImplCopyWithImpl(_$BrandLoadingStateImpl _value,
      $Res Function(_$BrandLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BrandLoadingStateImpl implements BrandLoadingState {
  const _$BrandLoadingStateImpl();

  @override
  String toString() {
    return 'BrandState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BrandLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Brand> brands) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Brand> brands)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Brand> brands)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BrandInitialState value) initial,
    required TResult Function(BrandLoadingState value) loading,
    required TResult Function(BrandLoadedState value) loaded,
    required TResult Function(BrandErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BrandInitialState value)? initial,
    TResult? Function(BrandLoadingState value)? loading,
    TResult? Function(BrandLoadedState value)? loaded,
    TResult? Function(BrandErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BrandInitialState value)? initial,
    TResult Function(BrandLoadingState value)? loading,
    TResult Function(BrandLoadedState value)? loaded,
    TResult Function(BrandErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class BrandLoadingState implements BrandState {
  const factory BrandLoadingState() = _$BrandLoadingStateImpl;
}

/// @nodoc
abstract class _$$BrandLoadedStateImplCopyWith<$Res> {
  factory _$$BrandLoadedStateImplCopyWith(_$BrandLoadedStateImpl value,
          $Res Function(_$BrandLoadedStateImpl) then) =
      __$$BrandLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Brand> brands});
}

/// @nodoc
class __$$BrandLoadedStateImplCopyWithImpl<$Res>
    extends _$BrandStateCopyWithImpl<$Res, _$BrandLoadedStateImpl>
    implements _$$BrandLoadedStateImplCopyWith<$Res> {
  __$$BrandLoadedStateImplCopyWithImpl(_$BrandLoadedStateImpl _value,
      $Res Function(_$BrandLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brands = null,
  }) {
    return _then(_$BrandLoadedStateImpl(
      null == brands
          ? _value._brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
    ));
  }
}

/// @nodoc

class _$BrandLoadedStateImpl implements BrandLoadedState {
  const _$BrandLoadedStateImpl(final List<Brand> brands) : _brands = brands;

  final List<Brand> _brands;
  @override
  List<Brand> get brands {
    if (_brands is EqualUnmodifiableListView) return _brands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brands);
  }

  @override
  String toString() {
    return 'BrandState.loaded(brands: $brands)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandLoadedStateImpl &&
            const DeepCollectionEquality().equals(other._brands, _brands));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_brands));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandLoadedStateImplCopyWith<_$BrandLoadedStateImpl> get copyWith =>
      __$$BrandLoadedStateImplCopyWithImpl<_$BrandLoadedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Brand> brands) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loaded(brands);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Brand> brands)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loaded?.call(brands);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Brand> brands)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(brands);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BrandInitialState value) initial,
    required TResult Function(BrandLoadingState value) loading,
    required TResult Function(BrandLoadedState value) loaded,
    required TResult Function(BrandErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BrandInitialState value)? initial,
    TResult? Function(BrandLoadingState value)? loading,
    TResult? Function(BrandLoadedState value)? loaded,
    TResult? Function(BrandErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BrandInitialState value)? initial,
    TResult Function(BrandLoadingState value)? loading,
    TResult Function(BrandLoadedState value)? loaded,
    TResult Function(BrandErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class BrandLoadedState implements BrandState {
  const factory BrandLoadedState(final List<Brand> brands) =
      _$BrandLoadedStateImpl;

  List<Brand> get brands;
  @JsonKey(ignore: true)
  _$$BrandLoadedStateImplCopyWith<_$BrandLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BrandErrorStateImplCopyWith<$Res> {
  factory _$$BrandErrorStateImplCopyWith(_$BrandErrorStateImpl value,
          $Res Function(_$BrandErrorStateImpl) then) =
      __$$BrandErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$$BrandErrorStateImplCopyWithImpl<$Res>
    extends _$BrandStateCopyWithImpl<$Res, _$BrandErrorStateImpl>
    implements _$$BrandErrorStateImplCopyWith<$Res> {
  __$$BrandErrorStateImplCopyWithImpl(
      _$BrandErrorStateImpl _value, $Res Function(_$BrandErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$BrandErrorStateImpl(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$BrandErrorStateImpl implements BrandErrorState {
  const _$BrandErrorStateImpl(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'BrandState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandErrorStateImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandErrorStateImplCopyWith<_$BrandErrorStateImpl> get copyWith =>
      __$$BrandErrorStateImplCopyWithImpl<_$BrandErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Brand> brands) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Brand> brands)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Brand> brands)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BrandInitialState value) initial,
    required TResult Function(BrandLoadingState value) loading,
    required TResult Function(BrandLoadedState value) loaded,
    required TResult Function(BrandErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BrandInitialState value)? initial,
    TResult? Function(BrandLoadingState value)? loading,
    TResult? Function(BrandLoadedState value)? loaded,
    TResult? Function(BrandErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BrandInitialState value)? initial,
    TResult Function(BrandLoadingState value)? loading,
    TResult Function(BrandLoadedState value)? loaded,
    TResult Function(BrandErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class BrandErrorState implements BrandState {
  const factory BrandErrorState(final Failure failure) = _$BrandErrorStateImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$BrandErrorStateImplCopyWith<_$BrandErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

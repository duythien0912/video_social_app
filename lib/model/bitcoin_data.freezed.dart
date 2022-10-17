// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bitcoin_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BitcoinData _$BitcoinDataFromJson(Map<String, dynamic> json) {
  return _BitcoinData.fromJson(json);
}

/// @nodoc
mixin _$BitcoinData {
  Map<String, Datum>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BitcoinDataCopyWith<BitcoinData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BitcoinDataCopyWith<$Res> {
  factory $BitcoinDataCopyWith(
          BitcoinData value, $Res Function(BitcoinData) then) =
      _$BitcoinDataCopyWithImpl<$Res, BitcoinData>;
  @useResult
  $Res call({Map<String, Datum>? data});
}

/// @nodoc
class _$BitcoinDataCopyWithImpl<$Res, $Val extends BitcoinData>
    implements $BitcoinDataCopyWith<$Res> {
  _$BitcoinDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, Datum>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BitcoinDataCopyWith<$Res>
    implements $BitcoinDataCopyWith<$Res> {
  factory _$$_BitcoinDataCopyWith(
          _$_BitcoinData value, $Res Function(_$_BitcoinData) then) =
      __$$_BitcoinDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, Datum>? data});
}

/// @nodoc
class __$$_BitcoinDataCopyWithImpl<$Res>
    extends _$BitcoinDataCopyWithImpl<$Res, _$_BitcoinData>
    implements _$$_BitcoinDataCopyWith<$Res> {
  __$$_BitcoinDataCopyWithImpl(
      _$_BitcoinData _value, $Res Function(_$_BitcoinData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_BitcoinData(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, Datum>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BitcoinData implements _BitcoinData {
  const _$_BitcoinData({final Map<String, Datum>? data}) : _data = data;

  factory _$_BitcoinData.fromJson(Map<String, dynamic> json) =>
      _$$_BitcoinDataFromJson(json);

  final Map<String, Datum>? _data;
  @override
  Map<String, Datum>? get data {
    final value = _data;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'BitcoinData(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BitcoinData &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BitcoinDataCopyWith<_$_BitcoinData> get copyWith =>
      __$$_BitcoinDataCopyWithImpl<_$_BitcoinData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BitcoinDataToJson(
      this,
    );
  }
}

abstract class _BitcoinData implements BitcoinData {
  const factory _BitcoinData({final Map<String, Datum>? data}) = _$_BitcoinData;

  factory _BitcoinData.fromJson(Map<String, dynamic> json) =
      _$_BitcoinData.fromJson;

  @override
  Map<String, Datum>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_BitcoinDataCopyWith<_$_BitcoinData> get copyWith =>
      throw _privateConstructorUsedError;
}

Datum _$DatumFromJson(Map<String, dynamic> json) {
  return _Datum.fromJson(json);
}

/// @nodoc
mixin _$Datum {
  Address? get address => throw _privateConstructorUsedError;
  List<String>? get transactions => throw _privateConstructorUsedError;
  List<Utxo>? get utxo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DatumCopyWith<Datum> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatumCopyWith<$Res> {
  factory $DatumCopyWith(Datum value, $Res Function(Datum) then) =
      _$DatumCopyWithImpl<$Res, Datum>;
  @useResult
  $Res call({Address? address, List<String>? transactions, List<Utxo>? utxo});

  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$DatumCopyWithImpl<$Res, $Val extends Datum>
    implements $DatumCopyWith<$Res> {
  _$DatumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? transactions = freezed,
    Object? utxo = freezed,
  }) {
    return _then(_value.copyWith(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      transactions: freezed == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      utxo: freezed == utxo
          ? _value.utxo
          : utxo // ignore: cast_nullable_to_non_nullable
              as List<Utxo>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DatumCopyWith<$Res> implements $DatumCopyWith<$Res> {
  factory _$$_DatumCopyWith(_$_Datum value, $Res Function(_$_Datum) then) =
      __$$_DatumCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Address? address, List<String>? transactions, List<Utxo>? utxo});

  @override
  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$$_DatumCopyWithImpl<$Res> extends _$DatumCopyWithImpl<$Res, _$_Datum>
    implements _$$_DatumCopyWith<$Res> {
  __$$_DatumCopyWithImpl(_$_Datum _value, $Res Function(_$_Datum) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? transactions = freezed,
    Object? utxo = freezed,
  }) {
    return _then(_$_Datum(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      transactions: freezed == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      utxo: freezed == utxo
          ? _value._utxo
          : utxo // ignore: cast_nullable_to_non_nullable
              as List<Utxo>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Datum implements _Datum {
  const _$_Datum(
      {this.address, final List<String>? transactions, final List<Utxo>? utxo})
      : _transactions = transactions,
        _utxo = utxo;

  factory _$_Datum.fromJson(Map<String, dynamic> json) =>
      _$$_DatumFromJson(json);

  @override
  final Address? address;
  final List<String>? _transactions;
  @override
  List<String>? get transactions {
    final value = _transactions;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Utxo>? _utxo;
  @override
  List<Utxo>? get utxo {
    final value = _utxo;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Datum(address: $address, transactions: $transactions, utxo: $utxo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Datum &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            const DeepCollectionEquality().equals(other._utxo, _utxo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      address,
      const DeepCollectionEquality().hash(_transactions),
      const DeepCollectionEquality().hash(_utxo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DatumCopyWith<_$_Datum> get copyWith =>
      __$$_DatumCopyWithImpl<_$_Datum>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DatumToJson(
      this,
    );
  }
}

abstract class _Datum implements Datum {
  const factory _Datum(
      {final Address? address,
      final List<String>? transactions,
      final List<Utxo>? utxo}) = _$_Datum;

  factory _Datum.fromJson(Map<String, dynamic> json) = _$_Datum.fromJson;

  @override
  Address? get address;
  @override
  List<String>? get transactions;
  @override
  List<Utxo>? get utxo;
  @override
  @JsonKey(ignore: true)
  _$$_DatumCopyWith<_$_Datum> get copyWith =>
      throw _privateConstructorUsedError;
}

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  String? get type => throw _privateConstructorUsedError;
  String? get scriptHex => throw _privateConstructorUsedError;
  int? get balance => throw _privateConstructorUsedError;
  int? get balanceUsd => throw _privateConstructorUsedError;
  int? get received => throw _privateConstructorUsedError;
  int? get receivedUsd => throw _privateConstructorUsedError;
  int? get spent => throw _privateConstructorUsedError;
  int? get spentUsd => throw _privateConstructorUsedError;
  int? get outputCount => throw _privateConstructorUsedError;
  int? get unspentOutputCount => throw _privateConstructorUsedError;
  DateTime? get firstSeenReceiving => throw _privateConstructorUsedError;
  DateTime? get lastSeenReceiving => throw _privateConstructorUsedError;
  DateTime? get firstSeenSpending => throw _privateConstructorUsedError;
  DateTime? get lastSeenSpending => throw _privateConstructorUsedError;
  dynamic? get scripthashType => throw _privateConstructorUsedError;
  int? get transactionCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call(
      {String? type,
      String? scriptHex,
      int? balance,
      int? balanceUsd,
      int? received,
      int? receivedUsd,
      int? spent,
      int? spentUsd,
      int? outputCount,
      int? unspentOutputCount,
      DateTime? firstSeenReceiving,
      DateTime? lastSeenReceiving,
      DateTime? firstSeenSpending,
      DateTime? lastSeenSpending,
      dynamic? scripthashType,
      int? transactionCount});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? scriptHex = freezed,
    Object? balance = freezed,
    Object? balanceUsd = freezed,
    Object? received = freezed,
    Object? receivedUsd = freezed,
    Object? spent = freezed,
    Object? spentUsd = freezed,
    Object? outputCount = freezed,
    Object? unspentOutputCount = freezed,
    Object? firstSeenReceiving = freezed,
    Object? lastSeenReceiving = freezed,
    Object? firstSeenSpending = freezed,
    Object? lastSeenSpending = freezed,
    Object? scripthashType = null,
    Object? transactionCount = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      scriptHex: freezed == scriptHex
          ? _value.scriptHex
          : scriptHex // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int?,
      balanceUsd: freezed == balanceUsd
          ? _value.balanceUsd
          : balanceUsd // ignore: cast_nullable_to_non_nullable
              as int?,
      received: freezed == received
          ? _value.received
          : received // ignore: cast_nullable_to_non_nullable
              as int?,
      receivedUsd: freezed == receivedUsd
          ? _value.receivedUsd
          : receivedUsd // ignore: cast_nullable_to_non_nullable
              as int?,
      spent: freezed == spent
          ? _value.spent
          : spent // ignore: cast_nullable_to_non_nullable
              as int?,
      spentUsd: freezed == spentUsd
          ? _value.spentUsd
          : spentUsd // ignore: cast_nullable_to_non_nullable
              as int?,
      outputCount: freezed == outputCount
          ? _value.outputCount
          : outputCount // ignore: cast_nullable_to_non_nullable
              as int?,
      unspentOutputCount: freezed == unspentOutputCount
          ? _value.unspentOutputCount
          : unspentOutputCount // ignore: cast_nullable_to_non_nullable
              as int?,
      firstSeenReceiving: freezed == firstSeenReceiving
          ? _value.firstSeenReceiving
          : firstSeenReceiving // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastSeenReceiving: freezed == lastSeenReceiving
          ? _value.lastSeenReceiving
          : lastSeenReceiving // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      firstSeenSpending: freezed == firstSeenSpending
          ? _value.firstSeenSpending
          : firstSeenSpending // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastSeenSpending: freezed == lastSeenSpending
          ? _value.lastSeenSpending
          : lastSeenSpending // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      scripthashType: null == scripthashType
          ? _value.scripthashType
          : scripthashType // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      transactionCount: freezed == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$_AddressCopyWith(
          _$_Address value, $Res Function(_$_Address) then) =
      __$$_AddressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? type,
      String? scriptHex,
      int? balance,
      int? balanceUsd,
      int? received,
      int? receivedUsd,
      int? spent,
      int? spentUsd,
      int? outputCount,
      int? unspentOutputCount,
      DateTime? firstSeenReceiving,
      DateTime? lastSeenReceiving,
      DateTime? firstSeenSpending,
      DateTime? lastSeenSpending,
      dynamic? scripthashType,
      int? transactionCount});
}

/// @nodoc
class __$$_AddressCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$_Address>
    implements _$$_AddressCopyWith<$Res> {
  __$$_AddressCopyWithImpl(_$_Address _value, $Res Function(_$_Address) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? scriptHex = freezed,
    Object? balance = freezed,
    Object? balanceUsd = freezed,
    Object? received = freezed,
    Object? receivedUsd = freezed,
    Object? spent = freezed,
    Object? spentUsd = freezed,
    Object? outputCount = freezed,
    Object? unspentOutputCount = freezed,
    Object? firstSeenReceiving = freezed,
    Object? lastSeenReceiving = freezed,
    Object? firstSeenSpending = freezed,
    Object? lastSeenSpending = freezed,
    Object? scripthashType = null,
    Object? transactionCount = freezed,
  }) {
    return _then(_$_Address(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      scriptHex: freezed == scriptHex
          ? _value.scriptHex
          : scriptHex // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int?,
      balanceUsd: freezed == balanceUsd
          ? _value.balanceUsd
          : balanceUsd // ignore: cast_nullable_to_non_nullable
              as int?,
      received: freezed == received
          ? _value.received
          : received // ignore: cast_nullable_to_non_nullable
              as int?,
      receivedUsd: freezed == receivedUsd
          ? _value.receivedUsd
          : receivedUsd // ignore: cast_nullable_to_non_nullable
              as int?,
      spent: freezed == spent
          ? _value.spent
          : spent // ignore: cast_nullable_to_non_nullable
              as int?,
      spentUsd: freezed == spentUsd
          ? _value.spentUsd
          : spentUsd // ignore: cast_nullable_to_non_nullable
              as int?,
      outputCount: freezed == outputCount
          ? _value.outputCount
          : outputCount // ignore: cast_nullable_to_non_nullable
              as int?,
      unspentOutputCount: freezed == unspentOutputCount
          ? _value.unspentOutputCount
          : unspentOutputCount // ignore: cast_nullable_to_non_nullable
              as int?,
      firstSeenReceiving: freezed == firstSeenReceiving
          ? _value.firstSeenReceiving
          : firstSeenReceiving // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastSeenReceiving: freezed == lastSeenReceiving
          ? _value.lastSeenReceiving
          : lastSeenReceiving // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      firstSeenSpending: freezed == firstSeenSpending
          ? _value.firstSeenSpending
          : firstSeenSpending // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastSeenSpending: freezed == lastSeenSpending
          ? _value.lastSeenSpending
          : lastSeenSpending // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      scripthashType: null == scripthashType
          ? _value.scripthashType
          : scripthashType // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      transactionCount: freezed == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Address implements _Address {
  const _$_Address(
      {this.type,
      this.scriptHex,
      this.balance,
      this.balanceUsd,
      this.received,
      this.receivedUsd,
      this.spent,
      this.spentUsd,
      this.outputCount,
      this.unspentOutputCount,
      this.firstSeenReceiving,
      this.lastSeenReceiving,
      this.firstSeenSpending,
      this.lastSeenSpending,
      this.scripthashType,
      this.transactionCount});

  factory _$_Address.fromJson(Map<String, dynamic> json) =>
      _$$_AddressFromJson(json);

  @override
  final String? type;
  @override
  final String? scriptHex;
  @override
  final int? balance;
  @override
  final int? balanceUsd;
  @override
  final int? received;
  @override
  final int? receivedUsd;
  @override
  final int? spent;
  @override
  final int? spentUsd;
  @override
  final int? outputCount;
  @override
  final int? unspentOutputCount;
  @override
  final DateTime? firstSeenReceiving;
  @override
  final DateTime? lastSeenReceiving;
  @override
  final DateTime? firstSeenSpending;
  @override
  final DateTime? lastSeenSpending;
  @override
  final dynamic? scripthashType;
  @override
  final int? transactionCount;

  @override
  String toString() {
    return 'Address(type: $type, scriptHex: $scriptHex, balance: $balance, balanceUsd: $balanceUsd, received: $received, receivedUsd: $receivedUsd, spent: $spent, spentUsd: $spentUsd, outputCount: $outputCount, unspentOutputCount: $unspentOutputCount, firstSeenReceiving: $firstSeenReceiving, lastSeenReceiving: $lastSeenReceiving, firstSeenSpending: $firstSeenSpending, lastSeenSpending: $lastSeenSpending, scripthashType: $scripthashType, transactionCount: $transactionCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Address &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.scriptHex, scriptHex) ||
                other.scriptHex == scriptHex) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.balanceUsd, balanceUsd) ||
                other.balanceUsd == balanceUsd) &&
            (identical(other.received, received) ||
                other.received == received) &&
            (identical(other.receivedUsd, receivedUsd) ||
                other.receivedUsd == receivedUsd) &&
            (identical(other.spent, spent) || other.spent == spent) &&
            (identical(other.spentUsd, spentUsd) ||
                other.spentUsd == spentUsd) &&
            (identical(other.outputCount, outputCount) ||
                other.outputCount == outputCount) &&
            (identical(other.unspentOutputCount, unspentOutputCount) ||
                other.unspentOutputCount == unspentOutputCount) &&
            (identical(other.firstSeenReceiving, firstSeenReceiving) ||
                other.firstSeenReceiving == firstSeenReceiving) &&
            (identical(other.lastSeenReceiving, lastSeenReceiving) ||
                other.lastSeenReceiving == lastSeenReceiving) &&
            (identical(other.firstSeenSpending, firstSeenSpending) ||
                other.firstSeenSpending == firstSeenSpending) &&
            (identical(other.lastSeenSpending, lastSeenSpending) ||
                other.lastSeenSpending == lastSeenSpending) &&
            const DeepCollectionEquality()
                .equals(other.scripthashType, scripthashType) &&
            (identical(other.transactionCount, transactionCount) ||
                other.transactionCount == transactionCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      scriptHex,
      balance,
      balanceUsd,
      received,
      receivedUsd,
      spent,
      spentUsd,
      outputCount,
      unspentOutputCount,
      firstSeenReceiving,
      lastSeenReceiving,
      firstSeenSpending,
      lastSeenSpending,
      const DeepCollectionEquality().hash(scripthashType),
      transactionCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddressCopyWith<_$_Address> get copyWith =>
      __$$_AddressCopyWithImpl<_$_Address>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressToJson(
      this,
    );
  }
}

abstract class _Address implements Address {
  const factory _Address(
      {final String? type,
      final String? scriptHex,
      final int? balance,
      final int? balanceUsd,
      final int? received,
      final int? receivedUsd,
      final int? spent,
      final int? spentUsd,
      final int? outputCount,
      final int? unspentOutputCount,
      final DateTime? firstSeenReceiving,
      final DateTime? lastSeenReceiving,
      final DateTime? firstSeenSpending,
      final DateTime? lastSeenSpending,
      final dynamic? scripthashType,
      final int? transactionCount}) = _$_Address;

  factory _Address.fromJson(Map<String, dynamic> json) = _$_Address.fromJson;

  @override
  String? get type;
  @override
  String? get scriptHex;
  @override
  int? get balance;
  @override
  int? get balanceUsd;
  @override
  int? get received;
  @override
  int? get receivedUsd;
  @override
  int? get spent;
  @override
  int? get spentUsd;
  @override
  int? get outputCount;
  @override
  int? get unspentOutputCount;
  @override
  DateTime? get firstSeenReceiving;
  @override
  DateTime? get lastSeenReceiving;
  @override
  DateTime? get firstSeenSpending;
  @override
  DateTime? get lastSeenSpending;
  @override
  dynamic? get scripthashType;
  @override
  int? get transactionCount;
  @override
  @JsonKey(ignore: true)
  _$$_AddressCopyWith<_$_Address> get copyWith =>
      throw _privateConstructorUsedError;
}

Utxo _$UtxoFromJson(Map<String, dynamic> json) {
  return _Utxo.fromJson(json);
}

/// @nodoc
mixin _$Utxo {
  int? get blockId => throw _privateConstructorUsedError;
  String? get transactionHash => throw _privateConstructorUsedError;
  int? get index => throw _privateConstructorUsedError;
  int? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UtxoCopyWith<Utxo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UtxoCopyWith<$Res> {
  factory $UtxoCopyWith(Utxo value, $Res Function(Utxo) then) =
      _$UtxoCopyWithImpl<$Res, Utxo>;
  @useResult
  $Res call({int? blockId, String? transactionHash, int? index, int? value});
}

/// @nodoc
class _$UtxoCopyWithImpl<$Res, $Val extends Utxo>
    implements $UtxoCopyWith<$Res> {
  _$UtxoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockId = freezed,
    Object? transactionHash = freezed,
    Object? index = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      blockId: freezed == blockId
          ? _value.blockId
          : blockId // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionHash: freezed == transactionHash
          ? _value.transactionHash
          : transactionHash // ignore: cast_nullable_to_non_nullable
              as String?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UtxoCopyWith<$Res> implements $UtxoCopyWith<$Res> {
  factory _$$_UtxoCopyWith(_$_Utxo value, $Res Function(_$_Utxo) then) =
      __$$_UtxoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? blockId, String? transactionHash, int? index, int? value});
}

/// @nodoc
class __$$_UtxoCopyWithImpl<$Res> extends _$UtxoCopyWithImpl<$Res, _$_Utxo>
    implements _$$_UtxoCopyWith<$Res> {
  __$$_UtxoCopyWithImpl(_$_Utxo _value, $Res Function(_$_Utxo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockId = freezed,
    Object? transactionHash = freezed,
    Object? index = freezed,
    Object? value = freezed,
  }) {
    return _then(_$_Utxo(
      blockId: freezed == blockId
          ? _value.blockId
          : blockId // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionHash: freezed == transactionHash
          ? _value.transactionHash
          : transactionHash // ignore: cast_nullable_to_non_nullable
              as String?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Utxo implements _Utxo {
  const _$_Utxo({this.blockId, this.transactionHash, this.index, this.value});

  factory _$_Utxo.fromJson(Map<String, dynamic> json) => _$$_UtxoFromJson(json);

  @override
  final int? blockId;
  @override
  final String? transactionHash;
  @override
  final int? index;
  @override
  final int? value;

  @override
  String toString() {
    return 'Utxo(blockId: $blockId, transactionHash: $transactionHash, index: $index, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Utxo &&
            (identical(other.blockId, blockId) || other.blockId == blockId) &&
            (identical(other.transactionHash, transactionHash) ||
                other.transactionHash == transactionHash) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, blockId, transactionHash, index, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UtxoCopyWith<_$_Utxo> get copyWith =>
      __$$_UtxoCopyWithImpl<_$_Utxo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UtxoToJson(
      this,
    );
  }
}

abstract class _Utxo implements Utxo {
  const factory _Utxo(
      {final int? blockId,
      final String? transactionHash,
      final int? index,
      final int? value}) = _$_Utxo;

  factory _Utxo.fromJson(Map<String, dynamic> json) = _$_Utxo.fromJson;

  @override
  int? get blockId;
  @override
  String? get transactionHash;
  @override
  int? get index;
  @override
  int? get value;
  @override
  @JsonKey(ignore: true)
  _$$_UtxoCopyWith<_$_Utxo> get copyWith => throw _privateConstructorUsedError;
}

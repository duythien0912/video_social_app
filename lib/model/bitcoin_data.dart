// To parse this JSON data, do
//
//     final bitcoinData = bitcoinDataFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'bitcoin_data.freezed.dart';
part 'bitcoin_data.g.dart';

BitcoinData bitcoinDataFromJson(String str) =>
    BitcoinData.fromJson(json.decode(str));

String bitcoinDataToJson(BitcoinData data) => json.encode(data.toJson());

@freezed
class BitcoinData with _$BitcoinData {
  const factory BitcoinData({
    Map<String, Datum>? data,
  }) = _BitcoinData;

  factory BitcoinData.fromJson(Map<String, dynamic> json) =>
      _$BitcoinDataFromJson(json);
}

@freezed
class Datum with _$Datum {
  const factory Datum({
    Address? address,
    List<String>? transactions,
    List<Utxo>? utxo,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    String? type,
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
    int? transactionCount,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

@freezed
class Utxo with _$Utxo {
  const factory Utxo({
    int? blockId,
    String? transactionHash,
    int? index,
    int? value,
  }) = _Utxo;

  factory Utxo.fromJson(Map<String, dynamic> json) => _$UtxoFromJson(json);
}

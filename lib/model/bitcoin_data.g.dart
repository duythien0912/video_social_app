// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bitcoin_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BitcoinData _$$_BitcoinDataFromJson(Map<String, dynamic> json) =>
    _$_BitcoinData(
      data: (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Datum.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$_BitcoinDataToJson(_$_BitcoinData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$_Datum _$$_DatumFromJson(Map<String, dynamic> json) => _$_Datum(
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      utxo: (json['utxo'] as List<dynamic>?)
          ?.map((e) => Utxo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DatumToJson(_$_Datum instance) => <String, dynamic>{
      'address': instance.address,
      'transactions': instance.transactions,
      'utxo': instance.utxo,
    };

_$_Address _$$_AddressFromJson(Map<String, dynamic> json) => _$_Address(
      type: json['type'] as String?,
      scriptHex: json['scriptHex'] as String?,
      balance: json['balance'] as int?,
      balanceUsd: json['balanceUsd'] as int?,
      received: json['received'] as int?,
      receivedUsd: json['receivedUsd'] as int?,
      spent: json['spent'] as int?,
      spentUsd: json['spentUsd'] as int?,
      outputCount: json['outputCount'] as int?,
      unspentOutputCount: json['unspentOutputCount'] as int?,
      firstSeenReceiving: json['firstSeenReceiving'] == null
          ? null
          : DateTime.parse(json['firstSeenReceiving'] as String),
      lastSeenReceiving: json['lastSeenReceiving'] == null
          ? null
          : DateTime.parse(json['lastSeenReceiving'] as String),
      firstSeenSpending: json['firstSeenSpending'] == null
          ? null
          : DateTime.parse(json['firstSeenSpending'] as String),
      lastSeenSpending: json['lastSeenSpending'] == null
          ? null
          : DateTime.parse(json['lastSeenSpending'] as String),
      scripthashType: json['scripthashType'],
      transactionCount: json['transactionCount'] as int?,
    );

Map<String, dynamic> _$$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'type': instance.type,
      'scriptHex': instance.scriptHex,
      'balance': instance.balance,
      'balanceUsd': instance.balanceUsd,
      'received': instance.received,
      'receivedUsd': instance.receivedUsd,
      'spent': instance.spent,
      'spentUsd': instance.spentUsd,
      'outputCount': instance.outputCount,
      'unspentOutputCount': instance.unspentOutputCount,
      'firstSeenReceiving': instance.firstSeenReceiving?.toIso8601String(),
      'lastSeenReceiving': instance.lastSeenReceiving?.toIso8601String(),
      'firstSeenSpending': instance.firstSeenSpending?.toIso8601String(),
      'lastSeenSpending': instance.lastSeenSpending?.toIso8601String(),
      'scripthashType': instance.scripthashType,
      'transactionCount': instance.transactionCount,
    };

_$_Utxo _$$_UtxoFromJson(Map<String, dynamic> json) => _$_Utxo(
      blockId: json['blockId'] as int?,
      transactionHash: json['transactionHash'] as String?,
      index: json['index'] as int?,
      value: json['value'] as int?,
    );

Map<String, dynamic> _$$_UtxoToJson(_$_Utxo instance) => <String, dynamic>{
      'blockId': instance.blockId,
      'transactionHash': instance.transactionHash,
      'index': instance.index,
      'value': instance.value,
    };

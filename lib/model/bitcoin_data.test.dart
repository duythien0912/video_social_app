import 'package:video_driven_app/model/bitcoin_data.dart';

testbitcoinData() {
  final bitcoinData = bitcoinDataFromJson(
      '{ "data": { "mzY1xnC5fYR7tJgvbs7huZXLcBTerHZWiG": { "address": { "type": "pubkeyhash", "script_hex": "76a914d09dde139020e2dc5d381a1e7e3e0613d352cd6a88ac", "balance": 646529, "balance_usd": 0, "received": 920630, "received_usd": 0, "spent": 274101, "spent_usd": 0, "output_count": 3, "unspent_output_count": 2, "first_seen_receiving": "2022-10-13 10:31:19", "last_seen_receiving": "2022-10-17 02:06:20", "first_seen_spending": "2022-10-14 10:12:28", "last_seen_spending": "2022-10-14 10:12:28", "scripthash_type": null, "transaction_count": 3 }, "transactions": [ "ce3930ff7d68430ef0f831787e80c09745572b5a2f50e2241acc7d991f5e047c", "6d64759a8e1a0b240ecefc35a9aed2611d2b52abec4587b0eb7834b13ac21758", "292d81fd1d7d390a9abdf374481e2f913260c80f4513381e12b921ff04483273" ], "utxo": [ { "block_id": 2375569, "transaction_hash": "ce3930ff7d68430ef0f831787e80c09745572b5a2f50e2241acc7d991f5e047c", "index": 0, "value": 393928 }, { "block_id": 2373482, "transaction_hash": "6d64759a8e1a0b240ecefc35a9aed2611d2b52abec4587b0eb7834b13ac21758", "index": 1, "value": 252601 } ] } }, "context": { "code": 200, "source": "D", "limit": "100,100", "offset": "0,0", "results": 1, "state": 2375738, "market_price_usd": 19250.67, "cache": { "live": false, "duration": 20, "since": "2022-10-17 06:56:29", "until": "2022-10-17 06:56:49", "time": 1.9073486328125e-6 }, "api": { "version": "2.0.95-ie", "last_major_update": "2021-07-19 00:00:00", "next_major_update": null, "documentation": "https://blockchair.com/api/docs", "notice": ":)" }, "servers": "API4,TBTC0", "time": 0.8335609436035156, "render_time": 0.0012409687042236328, "full_time": 0.0012428760528564453, "request_cost": 1 } }');
  print("bitcoinData::");
  print(bitcoinData);
}
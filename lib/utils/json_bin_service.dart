import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swapgo/data/models/master_json_data.dart';

class JsonBinService {

  static const String _apiKey = '\$2a\$10\$yuiMDZ8mCCHNKZ2Ky89BBuPSf4Kb6cFrZAR4YGAFrihpVMTuChKbu'; // 🔥 Put your jsonbin.io API key

  static const String _accessKey = '\$2a\$10\$PvuUqiIVU.6G1RqRPbz0X.KTZT0o4gZoTzQIvGKM57IxjKuDaeBZ2'; // 🔥 Put your jsonbin.io API key

  static const String _baseUrl = 'https://api.jsonbin.io/v3';

  // Create a new JSON bin
  static Future<String?> createBin(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/b/680cfb528561e97a50081cb1?meta=false'),
      headers: {
        'Content-Type': 'application/json',
        'X-Master-Key': _apiKey,
      },
      body: json.encode({"record": data}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final result = json.decode(response.body);
      final binId = result['metadata']['id'];
      print('✅ Bin created with ID: $binId');
      return binId;
    } else {
      print('❌ Failed to create bin: ${response.body}');
      return null;
    }
  }

  // Read a JSON bin
  static Future<List< dynamic>?> readBin(String binId) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/b/680cfb528561e97a50081cb1?meta=false'),
      headers: {
        'X-Master-Key': _apiKey,
        'X-Access-Key': _accessKey,
      },
    );

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      var mDataList = result as List<dynamic> ;

     // print('Bin Data: ${mDataList.data.fname}');
      return mDataList;
    } else {
      print('❌ Failed to read bin: ${response.body}');
      return null;
    }
  }

  // Update an existing JSON bin
  static Future<bool> updateBin(String binId, List<Map<String, dynamic>>  data) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/b/680cfb528561e97a50081cb1?meta=false'),
      headers: {
        'Content-Type': 'application/json',
        'X-Master-Key': _apiKey,
        'X-Access-Key': _accessKey,
      },
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      print('✅ Bin updated');
      return true;
    } else {
      print('❌ Failed to update bin: ${response.body}');
      return false;
    }
  }

  // Delete a JSON bin
  static Future<bool> deleteBin(String binId) async {
    final response = await http.delete(
      Uri.parse('$_baseUrl/bins/$binId'),
      headers: {
        'X-Master-Key': _apiKey,
      },
    );

    if (response.statusCode == 200) {
      print('✅ Bin deleted');
      return true;
    } else {
      print('❌ Failed to delete bin: ${response.body}');
      return false;
    }
  }
}
import 'dart:convert';

import 'package:http/http.dart' as http;

class NetHelper {
  static const apiKey = 'YjNlMjlhZjE1ZjBhNGMyOGE3ZDg5NzE2ZDljYjI0ZmM';
  NetHelper({required this.crypto, required this.currency});

  final String crypto;
  final String currency;

  Future<String> getDate() async {
    http.Response response = await http.get(
        Uri.parse(
            'https://apiv2.bitcoinaverage.com/indices/global/ticker/$crypto$currency'),
        headers: {'x-ba-key': apiKey});
    if (response.statusCode == 200) {
      dynamic curentcyData = jsonDecode(response.body);
      double price = curentcyData['last'];
      return price.toInt().toString();
    } else {
      int ErrorStatus = response.statusCode;
      print(ErrorStatus);
      return 'Error ${ErrorStatus.toString()}';
    }
  }
}

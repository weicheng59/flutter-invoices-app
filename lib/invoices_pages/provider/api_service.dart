import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiService {
  Future<double> converPrice(String to, String from, double amount) async {
    try {
      var url = Uri.parse(
          '${ApiConstants.baseUrl}${ApiConstants.converEndPoint}?to=$to&from=$from&amount=$amount');
      var response =
          await http.get(url, headers: {'apikey': ApiConstants.apiKey});
      if (response.statusCode == 200) {
        //{
        //     "success": true,
        //     "query": {
        //         "from": "USD",
        //         "to": "EUR",
        //         "amount": 1
        //     },
        //     "info": {
        //         "timestamp": 1661268123,
        //         "rate": 0.999995
        //     },
        //     "date": "2022-08-23",
        //     "result": 0.999995
        // }
        Map resJson = jsonDecode(response.body);
        if (resJson.containsKey('success')) {
          if (resJson['success'] == true) {
            return resJson['info']['rate'];
          }
        }
        return -1;
      }
      return -1;
    } catch (e) {
      log(e.toString());
      return -1;
    }
  }
}

class ApiConstants {
  static String baseUrl = 'https://api.apilayer.com';
  static String converEndPoint = '/fixer/convert';
  static String apiKey = 'DSVoHTEKhyWnXmLVuInWZgQOEKjYWn39';
}

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'F2289172-CD8B-47C3-BDA6-3E38302B5FFD';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoExchangeRate;

    for (String crpto in cryptoList) {
      String requestURL = '$coinAPIURL/$crpto/$selectedCurrency';
      http.Response response =
          await http.get(requestURL, headers: {'X-CoinAPI-Key': apiKey});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        double price = data['rate'];
        cryptoExchangeRate[crpto] = price.toStringAsFixed(0);
      } else {
        print(response.body);
        throw 'Problem Error code : ${response.statusCode}';
      }
    }
    return cryptoExchangeRate;
  }
}

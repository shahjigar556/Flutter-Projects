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

const List<String> cryptoList=[
  'BTC',
  'ETH',
  'LTC'
];

const baseURL='https://rest.coinapi.io/v1/exchangerate';
const apiKey='89578C67-9D73-47FC-86FE-60ED7077019E';

class CoinData{
  Future getData(String curr) async {
    Map<String,String> vals={};
    print('Entered coinData');
    for (var crypto in cryptoList){
      var url = Uri.parse('$baseURL/$crypto/$curr?apiKey=$apiKey');
      http.Response response=await http.get(url);
      print('resp=${response.statusCode}');
      if(response.statusCode==200){
        var data=jsonDecode(response.body);
        var rate=data['rate'].toStringAsFixed(3);
        print('rate=$rate');
        vals[crypto]=rate;
      }
    }
    return vals;
  }
}
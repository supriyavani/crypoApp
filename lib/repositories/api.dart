import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:test1/model/model.dart';


  Future<List<CurrencyList>> getCurrencies() async {
    var _key = '402ec5789d46f4ab42127ea7f3399e83ec198147';

    var url =
        "https://api.nomics.com/v1/currencies/ticker?key=$_key&ids=BTC,ETH,XRP&interval=1d,30d&convert=EUR&per-page=100&page=1";
    var response = await http.get(Uri.parse(url));
    var body = json.decode(response.body);

    return body.map((e) => CurrencyList.fromJson(e)).toList();
  }

  Future<Stream<List<CurrencyList>>> getCurrenciesStream() async {
    try {
      var _key = '402ec5789d46f4ab42127ea7f3399e83ec198147';

      var url =
          "https://api.nomics.com/v1/currencies/ticker?key=$_key&ids=BTC,ETH,XRP&interval=1d,30d&convert=EUR&per-page=100&page=1";
      var streamData = http.get(Uri.parse(url)).asStream();

      return streamData.map((event) {
        var stream = json.decode(event.body);
        return (stream['id'] as List)
            .map((e) => CurrencyList.fromJson(e))
            .toList();
      });
    } catch (e) {
      return Stream.value([]);
    }
  }


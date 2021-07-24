
import 'package:mvc_pattern/mvc_pattern.dart';

import 'package:test1/model/model.dart';
import 'package:test1/repositories/api.dart';

class CryptoController extends ControllerMVC {
  List<CurrencyList> cryptoList = [];
  CryptoController();

  /*BuildContext context;
  CryptoController(
    this.crpotoList,
    this.context,
  );*/
  

  get list => null;

  getData() async {
    try {
      cryptoList = await getCurrencies();
      setState(() {});
    } catch (e) {
      // final snackBar = SnackBar(content: Text("Failed due to " + e.toString()));
      //ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  getDataStream() async {
    Stream<List<CurrencyList>> crypoStream = await getCurrenciesStream();
    crypoStream.listen((List<CurrencyList> event) {
      setState(() {
        this.cryptoList = event;
      });
    }, onDone: () {}, onError: (e) {});
  }
}

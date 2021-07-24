import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:test1/contoller/api_controller.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends StateMVC<MainPage> {
  CryptoController controller = CryptoController();
  _MainPageState() : super(CryptoController());
  
  @override
  void initState() {
    controller.getDataStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.cryptoList.length > 0
            ? ListView.builder(
                itemCount: controller.cryptoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(controller.cryptoList[index].logo_url),
                    title: Text(controller.cryptoList[index].id),
                    trailing: Text(controller.cryptoList[index].id),

                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}



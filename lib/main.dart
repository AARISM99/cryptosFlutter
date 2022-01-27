import 'dart:async';
import 'dart:convert';

import 'package:cryptobase/coinCard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'coinModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  /*
    getData() async{
    Uri url = Uri.parse("http://192.168.119.1:8080/cryptos");
  var data = await http.get(url);
  print("gggggggggggggggggggggggggggggs");
    if(data.statusCode == 200){
      print("wa,,,,,,,,,,,,,,,,,,,,,,,,,,dfsdsvdvdvvvvvwdvdvv,,");
      List<dynamic> values1 = [];
      values1=jsonDecode(data.body);
      print(values1.length);

      return jsonDecode(data.body);
  }

   }
   */

  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    final response = await http.get(Uri.parse(
        'http://192.168.119.1:8080/cryptos'));

    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);

      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }
        setState(() {
          coinList;
        });
      }
      return coinList;
    } else {
      throw Exception('Failed to load coins');
    }
  }

  @override
  void initState() {
    fetchCoin();
    Timer.periodic(Duration(seconds: 10), (timer) => fetchCoin());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          title: Text(
            'CRYPTO CURRENCY',
            style: TextStyle(
              color: Colors.grey[900],
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: coinList.length,
          itemBuilder: (context, index) {
            return CoinCard(
              id:coinList[index].id,
              name: coinList[index].name,
              symbol: coinList[index].symbol,
              imageUrl: coinList[index].imageUrl,
              price: double.parse(coinList[index].price),
              change: double.parse(coinList[index].change),
              changePercentage:double.parse(coinList[index].changePercentage),
                circulatingSupply:coinList[index].circulatingSupply,
              high_24h:coinList[index].high_24h,
              low_24h:coinList[index].low_24h,
              high_7d:coinList[index].high_7d,
              low_7d:coinList[index].low_7d,
              high_30d:coinList[index].high_30d,
              low_30d:coinList[index].low_30d,
              high_90d:coinList[index].high_90d,
              low_90d:coinList[index].low_90d,
              high_52w:coinList[index].high_52w,
              low_52w:coinList[index].low_52w,
            );

          },

        ));
  }
}

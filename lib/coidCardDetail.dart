import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fl_chart/fl_chart.dart';

import 'package:http/http.dart' as http;

import 'appBar.dart';
import 'card.dart';
import 'dart:math';



class coindetail extends StatefulWidget {
  String _id="";
  String company ="";
  String image="";
  String name="";
  String price="";
  String price_chnage="";
  double per_chnage=null;
  String circulatingSupply;
  String high_24h;
  String low_24h;
  String high_7d;
  String low_7d;
  String high_30d;
  String low_30d;
  String high_90d;
  String low_90d;
  String high_52w;
  String low_52w;
  coindetail(
      this.high_24h,this.low_24h,this.high_7d,this.low_7d,this.high_30d,this.low_30d,this.high_90d,this.low_90d,this.high_52w,this.low_52w,

      this.circulatingSupply,this.company,
      this._id,this.image,this.name,this.per_chnage
      ,this.price,this.price_chnage

      );

  @override
  _coindetailState createState() => _coindetailState();
}

class _coindetailState extends State<coindetail> {
  List<charts.Series<Coin, int>> _seriesLineData;
  List<charts.Series<Coin, String>>  _seriesData;


  _generateData() {

    var data1 = [
      new Coin(1980, '24 H', (double.parse(widget.low_24h)/double.parse(widget.price))*100),
      new Coin(1980, '7 D', (double.parse(widget.low_7d)/double.parse(widget.price))*100),
      new Coin(1980, '30 D', (double.parse(widget.low_30d)/double.parse(widget.price))*100),
      new Coin(1980, '90 D', (double.parse(widget.low_90d)/double.parse(widget.price))*100),
      new Coin(1980, '52 W', (double.parse(widget.low_52w)/double.parse(widget.price))*100),



    ];
    var data2 = [
      new Coin(1985, '24 H', (double.parse(widget.high_24h)/double.parse(widget.price))*100),
      new Coin(1980, '7 D', (double.parse(widget.high_7d)/double.parse(widget.price))*100),
      new Coin(1985, '30 D', (double.parse(widget.high_30d)/double.parse(widget.price))*100),
      new Coin(1985, '90 D', (double.parse(widget.high_90d)/double.parse(widget.price))*100),
      new Coin(1985, '52 W', (double.parse(widget.high_52w)/double.parse(widget.price))*100),


    ];


   /*
    var linecoindata = [
      new Coin(1,  double.parse(widget.high_24h)),
      new Coin(2, double.parse(widget.low_24h)),
      new Coin(3, double.parse(widget.high_7d)),
      new Coin(4, double.parse(widget.low_7d)),
      new Coin(5, double.parse(widget.high_30d)),
      new Coin(6, double.parse(widget.low_30d)),
      new Coin(7, double.parse(widget.high_90d)),
      new Coin(8, double.parse(widget.low_90d)),
      new Coin(9, double.parse(widget.high_52w)),
      new Coin(10, double.parse(widget.low_52w)),

    ];
    */


/*

 */
    _seriesData.add(
      charts.Series(
        domainFn: (Coin coin, _) => coin.place,
        measureFn: (Coin coin, _) => coin.quantity,
        id: '2017',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.forwardHatch,
        fillColorFn: (Coin coin, _) =>
            charts.ColorUtil.fromDartColor(Colors.red),
      ),
    );

    _seriesData.add(
      charts.Series(

        domainFn: (Coin coin, _) => coin.place,
        measureFn: (Coin coin, _) => coin.quantity,
        labelAccessorFn: (Coin coin, _) => coin.quantity.toString(),
        id: '2018',
        data: data2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Coin coin, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff109618)),

      ),
    );



/*
 _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: '',
        data: linecoindata,
        domainFn: (Coin coin, _) => coin.yearval,
        measureFn: (Coin coin, _) => coin.val,
      ),
    );
 */


  }
@override
  void initState() {
  _seriesData = List<charts.Series<Coin, String>>();
  _seriesLineData = List<charts.Series<Coin, int>>();
    _generateData();
     super.initState();
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(

    backgroundColor: Colors.blueGrey[50],
    appBar: PreferredSize(
    preferredSize: Size.fromHeight(100.0),
    child: SafeArea(
    child: appBar(
    left: GestureDetector(
    onTap: () => Navigator.pop(context),
    child: Icon(Icons.arrow_back_ios, color: Colors.black54)),
    title: 'Coin Details',
    right: Icon(Icons.more_vert, color: Colors.black54)),
    ),
    ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            _cardWallet(
              iconUrl:widget.image,
              crypto: widget.name,
              cryptoShort: widget.company,
              totalCrypto:widget.circulatingSupply+widget.company,
              total: '\$ '+widget.price+' USD',
              precent:double.parse(widget.per_chnage.toDouble().toStringAsPrecision(3)),
            ),
            SizedBox(
              height: 50,
            ),
            card(
              padding: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            _dot(color: Colors.red),
                            Text(
                              'Low price %',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            _dot(color: Colors.green),
                            Text(
                              'High price %',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                   SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: Stack(children: [
                      charts.BarChart(
                        _seriesData,
                        animate: true,
                         // Hide domain axis.
                          barGroupingType: charts.BarGroupingType.grouped,
                        //behaviors: [new charts.SeriesLegend()],
                        animationDuration: Duration(seconds: 2),



                      ),

                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _dot({double size = 10, Color color = Colors.black}) {
    return Container(
      margin: EdgeInsets.all(10),
      width: size,
      height: size,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)),
        child: Container(
          color: color,
        ),
      ),
    );
  }
  Widget _cardWallet(
      {String crypto,
        cryptoShort,
        iconUrl,
        total,
        totalCrypto,
        double precent}) {
    return card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                '$iconUrl',
                width: 50,
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text('$crypto',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              ),
              Text('$cryptoShort',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),


            ],
          ),
          SizedBox(height: 20),
          Text(
            '$totalCrypto',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black87),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$total',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black38),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                    color: precent >= 0 ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Text(
                  precent >= 0 ? '+ $precent %' : '$precent %',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),

        ],
      ),
    );
  }
}

/*
class Coin {
  int yearval;
  double val;

  Coin(this.yearval, this.val);
}
 */

class Coin {
  String place;
  int year;
  double quantity;
  Coin(this.year, this.place, this.quantity);
}
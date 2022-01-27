import 'package:cryptobase/coidCardDetail.dart';
import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  CoinCard({
    @required this.id,
    @required this.name,
    @required this.symbol,
    @required this.imageUrl,
    @required this.price,
    @required this.change,
    @required this.changePercentage,
    @required this.circulatingSupply,
    @required this.high_24h,
    @required this.low_24h,
    @required this.high_7d,
    @required this.low_7d,
    @required this.high_30d,
    @required this.low_30d,
    @required this.high_90d,
    @required this.low_90d,
    @required this.high_52w,
    @required this.low_52w,

  });
  String id;
  String name;
  String symbol;
  String imageUrl;
  double price;
  double change;
  double changePercentage;
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

  @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[500],
                offset: Offset(4, 4),
                blurRadius: 10,
                spreadRadius: 1,
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(-4, -4),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[500],
                        offset: Offset(4, 4),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4, -4),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  height: 60,
                  width: 60,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context)=> coindetail(
                          high_24h,
                          low_24h,
                          high_7d,
                          low_7d,
                          high_30d,
                          low_30d,
                          high_90d,
                          low_90d,
                          high_52w,
                          low_52w,
                          circulatingSupply,symbol,
                          id,imageUrl,name,changePercentage,price.toString(),change.toString())));

                    },
                    child: ClipRRect(
                       child: Image.network(imageUrl),

                    ),
                  ),

                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          name,
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        symbol,
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                "\$ "+price.toDouble().toString(),
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      change.toDouble() < 0
                          ? change.toDouble().toString()
                          : '+' + change.toDouble().toString(),
                      style: TextStyle(
                        color: change.toDouble() < 0 ? Colors.red : Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      changePercentage.toDouble() < 0
                          ? changePercentage.toDouble().toStringAsPrecision(3) + '%'
                          : '+' + changePercentage.toDouble().toStringAsPrecision(3) + '%',
                      style: TextStyle(
                        color: changePercentage.toDouble() < 0
                            ? Colors.red
                            : Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
}

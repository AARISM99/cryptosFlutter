import 'package:flutter/material.dart';

class Coin {
  Coin({
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
  String price;
  String change;
  String changePercentage;
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

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      id:json['_id'],
      name: json['name'],
      symbol: json['company'],
      imageUrl: json['image'],
      price: json['price'],
      change: json['price_change_24h'],
      changePercentage: json['price_change_percentage'],
      circulatingSupply : json['circulatingSupply'],
      high_24h:json['high_24h'],
      low_24h:json['low_24h'],
      high_7d:json['high_7d'],
      low_7d:json['low_7d'],
      high_30d:json['high_30d'],
      low_30d:json['low_30d'],
      high_90d:json['high_90d'],
      low_90d:json['low_90d'],
      high_52w:json['high_52w'],
      low_52w:json['low_52w'],

    );
  }
}

List<Coin> coinList = [];

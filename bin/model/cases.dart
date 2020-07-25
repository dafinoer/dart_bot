


import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'value.dart';

class Cases extends Equatable {
  final Value confirm;

  final Value recovered;

  final Value deaths;

  final String lastUpdate;

  Cases({this.confirm, this.deaths, this.recovered, this.lastUpdate});

  @override
  List<Object> get props => [confirm, recovered, deaths];

  factory Cases.fromJson(Map<String, dynamic> json){
    return Cases(
      confirm: Value.fromJson(json['confirmed']),
      deaths: Value.fromJson(json['deaths']),
      recovered: Value.fromJson(json['recovered']),
      lastUpdate: json['lastUpdate']
    );
  }
}
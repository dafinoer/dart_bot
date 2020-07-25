import 'dart:convert';

import 'package:equatable/equatable.dart';

class Value extends Equatable {

  final int value;
  final String detailUrl;

  Value({this.value, this.detailUrl});

  @override
  List<Object> get props => [value, detailUrl];


  factory Value.fromJson(Map<String, dynamic> json){
    return Value(
      value: json['value'],
      detailUrl: json['detail']
    );
  }
}
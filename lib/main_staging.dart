import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';
import 'package:starter/bootstrap.dart';
import 'package:starter/common/utils/config.dart';

void main() {
  Flavor.create(
    Environment.alpha,
    color: Colors.green,
    name: 'PREVIEW',
    properties: {
      Keys.apiUrl: "https://jsonplaceholder.typicode.com/",
      Configs.customKey: 'value',
      Configs.titleApp: 'Starter App',
    },
  );
  bootstrap();
}

import 'package:hack24/services/postgre_SQL_connection.dart';
import 'package:postgres/postgres.dart';
import 'package:flutter/material.dart';

Future<List<dynamic>> locations() async {
  var connection = await initDatabaseConnection();
  final result = await connection.execute(
    Sql.named('SELECT p.titul, p.id_publicacio, p.img, c.nom, p.lat, p.lon, t.nom FROM publicacio p join compte c on (p.id_compte=c.id_compte) join tag t on (t.id_tag=p.id_tag) WHERE lat IS NOT NULL AND lon IS NOT NULL'),
  );

  List<dynamic> dataList = [];

  for (var row in result) {
    List<dynamic> rowData = [];

    for (var value in row) {
      rowData.add(value);
    }

    dataList.add(rowData);
  }

  await connection.close();

  return dataList;
}

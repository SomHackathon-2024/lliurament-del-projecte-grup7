import 'package:hack24/services/postgre_SQL_connection.dart';
import 'package:postgres/postgres.dart';
import 'package:flutter/material.dart';

Future<List<dynamic>> favourites(int usrid) async {
  var connection = await initDatabaseConnection();
  final result = await connection.execute(
    Sql.named(
        'SELECT p.titul, p.id_publicacio, p.img, c.nom, t.id_tag, p.text '
        'FROM publicacio p '
        'join inscripcio i on (i.id_publicacio=p.id_publicacio) '
        'join compte c on (i.id_compte=c.id_compte) '
        'join tag t on (p.id_tag=t.id_tag) '
        'where i.id_compte = @usrid '
    ),
    parameters: {
      'usrid': usrid,
    },
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
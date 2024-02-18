import 'package:hack24/services/postgre_SQL_connection.dart';
import 'package:postgres/postgres.dart';
import 'package:flutter/material.dart';

/*activities() async {
  var connection = await initDatabaseConnection();
  final result2 = await connection.execute(
    Sql.named('SELECT text, id_publicacio, img FROM publicacio '),
  );
  await connection.close();
  print(result2);
  return result2;
}*/

Future<List<dynamic>> activities() async {
  var connection = await initDatabaseConnection();
  final result = await connection.execute(

    Sql.named('SELECT p.titul, p.id_publicacio, p.img, c.nom, t.id_tag, p.text FROM publicacio p join compte c on (p.id_compte=c.id_compte) join tag t on (p.id_tag=t.id_tag)'),

   // Sql.named('SELECT p.titul, p.id_publicacio, p.img, c.nom ,p.text FROM publicacio p join compte c on (p.id_compte=c.id_compte)'),

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

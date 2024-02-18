import 'package:hack24/services/postgre_SQL_connection.dart';
import 'package:postgres/postgres.dart';
import 'package:flutter/material.dart';

Future<List<dynamic>> mainComments(String publicacio) async {
  var connection = await initDatabaseConnection();
  final result = await connection.execute(
    Sql.named(
        'SELECT cm.id_comentari, cm.id_compte, cm.id_publicacio, text, cp.nom '
        'FROM comentari cm LEFT JOIN compte cp on cm.id_compte = cp.id_compte '
        'where id_resposta IS NULL AND cm.id_publicacio=@id_publicacio'
    ), parameters: {
    'id_publicacio': publicacio,
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

Future<List<dynamic>> replyComments(String parentComm) async {
  var connection = await initDatabaseConnection();
  final result2 = await connection.execute(
    Sql.named(
        /*'select co.id_compte '
            'from compte co left join credencial cr on co.id_compte = cr.id_compte '
            'where cr.usuari=@usuari '
            'AND cr.contrasenya=@contrasenya'*/

        'WITH RECURSIVE SubComentarios AS ( '
          'SELECT c.id_comentari, c.id_resposta, c.text, c.id_compte, 1 AS nivel '
          'FROM Comentari c '
          'WHERE c.id_resposta = @parentComm '

          'UNION ALL '

          'SELECT c.id_comentari, c.id_resposta, c.text, c.id_compte, sc.nivel + 1 AS nivel '
          'FROM Comentari c '
          'INNER JOIN SubComentarios sc ON c.id_resposta = sc.id_comentari) '
        'SELECT sc.id_comentari, sc.id_resposta, sc.text, sc.id_compte, sc.nivel, cp.nom AS compte_name '
        'FROM SubComentarios sc '
        'LEFT JOIN Compte cp ON sc.id_compte = cp.id_compte '
        'ORDER BY sc.id_comentari '
    ),
    parameters: {
      'parentComm': parentComm,
    },
  );

  List<dynamic> dataList = [];

  for (var row in result2) {
    List<dynamic> rowData = [];

    for (var value in row) {
      rowData.add(value);
    }

    dataList.add(rowData);
  }

  await connection.close();

  print(dataList);

  return dataList;
}
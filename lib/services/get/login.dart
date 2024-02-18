import 'package:hack24/services/postgre_SQL_connection.dart';
import 'package:postgres/postgres.dart';
import 'package:flutter/material.dart';

login(String usr, String psw) async {
  var connection = await initDatabaseConnection();
  final result2 = await connection.execute(
    Sql.named(
        /*'SELECT usuari, contrasenya FROM credencial '
        'WHERE usuari=@usuari '
        'AND contrasenya=@contrasenya' */
        'select co.id_compte '
        'from compte co left join credencial cr on co.id_compte = cr.id_compte '
        'where cr.usuari=@usuari '
        'AND cr.contrasenya=@contrasenya'
    ),
    parameters: {
      'usuari': usr,
      'contrasenya': psw},
  );
  await connection.close();
  return result2;
}
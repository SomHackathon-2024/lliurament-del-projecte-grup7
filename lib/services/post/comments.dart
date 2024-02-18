import 'package:hack24/services/postgre_SQL_connection.dart';
import 'package:postgres/postgres.dart';
import 'package:flutter/material.dart';

pushComment(int idcompte, int idpublicacio, String text, int idresposta) async {
  String? resposta;

  if (idresposta == 0) {
    resposta = null;
  } else {
    resposta = idresposta.toString();
  }

  var connection = await initDatabaseConnection();
  final result = await connection.execute(
    Sql.named(
    'INSERT INTO Comentari (id_compte, id_publicacio, "text", id_resposta) VALUES (@id_compte, @id_publicacio, @text, @id_resposta)',
    ),
    parameters: {
      'id_compte': idcompte,
      'id_publicacio': idpublicacio,
      'text': text,
      'id_resposta': resposta,
    }
  );

  await connection.close();

  return result;
}

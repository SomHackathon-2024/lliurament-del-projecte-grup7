import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

initDatabaseConnection() async {
  /*final comDatabase = await Connection.open(
    conn,
    settings: conns,
  ).then((value) {
    debugPrint(value);
    debugPrint("Database Connected!");
  });*/

  final comu = await Connection.open(
    conn,
    settings: conns,
  );

  return comu;
}

final Endpoint conn = Endpoint(
  host: 'trumpet.db.elephantsql.com',
  database: 'vowytwwk',
  username: 'vowytwwk',
  password: 'V609UJLootbyZx3o3pMCr58RaDd4aVUD',
);

// The postgres server hosted locally doesn't have SSL by default. If you're
// accessing a postgres server over the Internet, the server should support
// SSL and you should swap out the mode with `SslMode.verifyFull`.
final ConnectionSettings conns = ConnectionSettings(sslMode: SslMode.disable);
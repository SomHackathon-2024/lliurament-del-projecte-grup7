import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hack24/screens/pages/publication_screen.dart';
import 'package:hack24/widgets/cardWidget.dart';

import '../../services/get/activities.dart';

class mainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  late Future<List<dynamic>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = activities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: futureData,
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var data = snapshot.data![index];
                print(data);
                return ListTile(
                  title: cardWidget(
                    titol: data[0].toString(),
                    id: data[1] as int,
                    linkImg: data[2].toString(),
                    autor: data[3].toString(),
                    tag: data[4] as int,
                    content: data[5].toString(),

                    action: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PublicationScreen(
                            titol: data[0].toString(),
                            id: data[1] as int,
                            linkImg: data[2].toString(),
                            autor: data[3].toString(),
                            contingut: data[5].toString(),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hack24/models/language/strings.dart';
import 'package:hack24/models/obj/user_data.dart';
import 'package:hack24/models/theme_provider.dart';
import 'package:hack24/screens/pages/publication_screen.dart';
import 'package:hack24/services/get/fav.dart';
import 'package:hack24/widgets/cardWidget.dart';
import 'package:provider/provider.dart';

class RewardsScreen extends StatefulWidget {
  @override
  _RewardsScreenState createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final appBarColor = isDarkMode ? Colors.black : Colors.grey[200];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          automaticallyImplyLeading: false,
          title: Text(
            AppStrings.getString(
              Provider.of<ThemeProvider>(context).locale,
              'Rewards',
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                text: AppStrings.getString(
                  Provider.of<ThemeProvider>(context).locale,
                  'Points',
                ),
                icon: Icon(Icons.attach_money),
              ),
              Tab(
                text: AppStrings.getString(
                  Provider.of<ThemeProvider>(context).locale,
                  'Activities',
                ),
                icon: Icon(Icons.directions_run),
              ),
              Tab(
                text: AppStrings.getString(
                  Provider.of<ThemeProvider>(context).locale,
                  'Posts',
                ),
                icon: Icon(Icons.public),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PointsTab(),
            ActivitiesTab(),
            PostsTab(),
          ],
        ),
      ),
    );
  }
}

class PointsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.getString(
                  Provider.of<ThemeProvider>(context).locale,
                  'Available points',
                ) ??
                    'Available points',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                '500',
                style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) {
              final date = DateTime.now().subtract(Duration(days: index));
              return ListTile(
                title: Text('Date: ${date.day}/${date.month}/${date.year}'),
                subtitle: Text('10 points'),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ActivitiesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.getString(
                  Provider.of<ThemeProvider>(context).locale,
                  'Activities made',
                ) ??
                    'Activities made',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '500',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) {
              final date = DateTime.now().subtract(Duration(days: index));
              return ListTile(
                title: Text('Date: ${date.day}/${date.month}/${date.year}'),
                subtitle: Text('10 points'),
              );
            },
          ),
        ),
      ],
    );
  }
}

class PostsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: favourites(Provider.of<UserData>(context, listen: false).idUser),
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
    );
  }
}

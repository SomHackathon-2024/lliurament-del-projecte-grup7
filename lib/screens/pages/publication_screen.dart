import 'package:flutter/material.dart';
import 'package:hack24/models/language/strings.dart';
import 'package:hack24/models/theme_provider.dart';
import 'package:hack24/widgets/comment_section.dart';
import 'package:provider/provider.dart';

class PublicationScreen extends StatefulWidget {
  final String titol;
  final int id;
  final String linkImg;
  final String autor;
  final String contingut;

  PublicationScreen({
    Key? key,
    required this.titol,
    required this.id,
    required this.linkImg,
    required this.contingut,
    required this.autor,
  }) : super(key: key);

  @override
  _PublicationScreenState createState() => _PublicationScreenState();
}

class _PublicationScreenState extends State<PublicationScreen> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.getString(
            Provider.of<ThemeProvider>(context).locale,
            'appName',
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 360,
                height: 139,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.linkImg,
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 360,
                height: 313,
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.grey[900] : Colors.grey[400],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    "${widget.contingut}${"\n Publicació feta per a: "} ${widget.autor}",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 360,
                height: 72,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.transparent,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.secondary,
                      onPrimary: Theme.of(context).colorScheme.surface,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'JOIN ACTIVITY',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              CommentSection(
                id: widget.id
              ),
            ],
          ),
        ),
      ),
    );
  }
}

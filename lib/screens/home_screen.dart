import 'package:flutter/material.dart';
import 'package:hack24/components/box/rounded_box.dart';
import 'package:hack24/components/button/rounded_button.dart';
import 'package:hack24/components/title_&_logo/title_and_logo_widget.dart';
import 'package:hack24/models/language/strings.dart';
import 'package:hack24/widgets/login_widget.dart';
import 'package:provider/provider.dart';
import '../models/theme_provider.dart';
import '../screens/display_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  Locale _selectedLocale = Locale('en');
  bool singIn = true;
  late TextEditingController nameController, pswController, mailController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    pswController = TextEditingController();
    mailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child:
      Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            TitleAndLogo(
              textColor: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0x00000000),
              ),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: _ReturnLoginSignupWidget(
                singIn,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            RoundedButton(
              onTap: () {//padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              },
              color: Theme.of(context).colorScheme.secondary,
              text: AppStrings.getString(
                  Provider.of<ThemeProvider>(context).locale,
                  'style',
              ),
              textColor: Theme.of(context).colorScheme.surface,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            DropdownButton<Locale>(
              value: Provider.of<ThemeProvider>(context).locale,
              items: [
                DropdownMenuItem(
                  value: Locale('en'),
                  child: Text('English'),
                ),
                DropdownMenuItem(
                  value: Locale('es'),
                  child: Text('Spanish'),
                ),
              ],
              onChanged: (selectedLocale) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleLanguage(selectedLocale!);
              },
            ),
          ],
        ),
      ),
      ),
    );
  }

  _ReturnLoginSignupWidget(bool singIn) {
    if (singIn) {
      return LoginWidget(
        nameController: nameController,
        pswController: pswController,
        color: Theme.of(context).colorScheme.secondary,
        textColor: Theme.of(context).colorScheme.surface,
        hintColor: Theme.of(context).colorScheme.secondary,
        boxName: AppStrings.getString(
          Provider.of<ThemeProvider>(context).locale,
          'name',
        ),
        boxHintName: AppStrings.getString(
          Provider.of<ThemeProvider>(context).locale,
          'hintName',
        ),
        boxPassword: AppStrings.getString(
          Provider.of<ThemeProvider>(context).locale,
          'password',
        ),
        boxHintPassword: AppStrings.getString(
          Provider.of<ThemeProvider>(context).locale,
          'hintPassword',
        ),
        boxLogin: AppStrings.getString(
          Provider.of<ThemeProvider>(context).locale,
          'login',
        ),
        function: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DisplayScreen())
          );
        },
      );
    } else {
      /*return SignupWidget(
          nameController: nameController,
          pswController: pswController,
          mailController: mailController
      );*/
    }
  }

  UpdateWidget(bool selectedWidget) {
    setState(() {
      singIn = selectedWidget;
    });
  }
}

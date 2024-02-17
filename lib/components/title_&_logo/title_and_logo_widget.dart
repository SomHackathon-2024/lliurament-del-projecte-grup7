import 'package:flutter/material.dart';

class TitleAndLogo extends StatefulWidget {
  // final String name;
  // const DogName(this.name);
  final Color? textColor;

  TitleAndLogo({
    super.key,
    required this.textColor,
  });

  _TitleAndLogo createState() => _TitleAndLogo();
}

class _TitleAndLogo extends State<TitleAndLogo> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'MyMataro',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: widget.textColor,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding:
            const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
            child: Image.asset(
              'assets/img/logo/logo_no_background.png',
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart' ;

class RoundedButton extends StatefulWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  final void Function()? onTap;

  RoundedButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.color,
    required this.textColor,
  });

  _RoundedButton createState() => _RoundedButton();
}

class _RoundedButton extends State<RoundedButton> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 230,
        height: 60,
        decoration: BoxDecoration(
          //border: Border.all(),
          color: widget.color,
          borderRadius: BorderRadius.circular(8),
        ), // BoxDecoration
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontFamily: 'Lexend Deca',
              color: widget.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

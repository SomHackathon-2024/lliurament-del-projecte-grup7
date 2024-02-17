import 'package:flutter/material.dart';

class DefaultButton extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final Function function;
  final ButtonStyle buttonStyle;
  final double height;
  final double width;

  DefaultButton({
    required this.text,
    required this.textStyle,
    required this.function,
    required this.buttonStyle,
    required this.height,
    required this.width,
  });

  _DefaultButton createState() => _DefaultButton();
}

class _DefaultButton extends State<DefaultButton> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextButton(
        onPressed: () {
          widget.function;
        },
        child: Text(
          widget.text,
          style: widget.textStyle,
          // TextStyle(
          //   fontFamily: 'Lexend Deca',
          //   color: Color(0xFF010101),
          //   fontSize: 16,
          //   fontWeight: FontWeight.w500,
          // ),
        ),
        style: widget.buttonStyle,
        // TextButton.styleFrom(
        //     elevation: 3,
        //     backgroundColor: Colors.white,
        //     side: const BorderSide(
        //       color: Colors.transparent,
        //       width: 1,
        //     ),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(8),
        //     )),
      ),
    );
  }
}

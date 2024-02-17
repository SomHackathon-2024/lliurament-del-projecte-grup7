import 'package:flutter/material.dart';
import 'package:hack24/components/text_form_field/pwd_form_field_request_widget.dart';
import 'package:hack24/components/text_form_field/text_form_field_request_widget.dart';

class LoginWidget extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController pswController;
  final String boxName;
  final String boxHintName;
  final String boxPassword;
  final String boxHintPassword;
  final String boxLogin;
  final Color? color;
  final Color? textColor;
  final Color? hintColor;
  final Function() function;

  LoginWidget({
    required this.nameController,
    required this.pswController,
    required this.textColor,
    required this.color,
    required this.hintColor,
    required this.boxName,
    required this.boxHintName,
    required this.boxPassword,
    required this.boxHintPassword,
    required this.boxLogin,
    required this.function,
  });

  _LoginWidget createState() => _LoginWidget();
}

class _LoginWidget extends State<LoginWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: TextFormFieldRequest(
            controller: widget.nameController,
            hint: widget.boxHintName,
            inputType: TextInputType.text,
            onChanged: NotifyParent,
            labelText: widget.boxName,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: PswFormFieldRequest(
            controller: widget.pswController,
            hint: widget.boxPassword,
            inputType: TextInputType.text,
            onChanged: NotifyParent,
            labelText: widget.boxPassword,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: SizedBox(
            width: 230,
            height: 60,
            child: TextButton(
              onPressed:
                widget.function,
              child: Text(
                widget.boxLogin,
                style: TextStyle(
                  fontFamily: 'Lexend Deca',
                  color: widget.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: TextButton.styleFrom(
                  elevation: 3,
                  backgroundColor: widget.color,
                  side: const BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
        ),
        /*Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: logic.ReturnVerificationMessage(
              NotifyParent
          ),
        ),*/
      ],
    );
  }

  NotifyParent(var content) {
    setState(() {
      content;
    });
  }
}

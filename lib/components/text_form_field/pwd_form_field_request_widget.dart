import 'package:flutter/material.dart';

class PswFormFieldRequest extends StatefulWidget {
  final String hint;
  final String labelText;
  final TextEditingController controller;
  final TextInputType inputType;
  final Function onChanged;

  PswFormFieldRequest({
    required this.hint,
    required this.controller,
    required this.onChanged,
    required this.labelText,
    this.inputType = TextInputType.text,
  });

  _PswFormFieldRequest createState() => _PswFormFieldRequest();
}

class _PswFormFieldRequest extends State<PswFormFieldRequest> {

  late bool passwordVisibility = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Theme.of(context).colorScheme.primaryContainer,
      controller: widget.controller,
      obscureText: !passwordVisibility,
      decoration: InputDecoration(
        labelText: widget.labelText,
        //alignLabelWithHint: true,
        labelStyle: TextStyle(
            fontFamily: 'Lexend Deca',
            color: Theme.of(context).colorScheme.primaryContainer,
            fontSize: 14,
            fontWeight: FontWeight.normal,
            height: 5
        ),
        hintText: widget.hint,
        hintStyle: TextStyle(
          fontFamily: 'Lexend Deca',
          color: Theme.of(context).colorScheme.primaryContainer,
          fontSize: 14,
          fontWeight: FontWeight.normal,
          //height: 5
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.onBackground,
        contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
        suffixIcon: InkWell(
          onTap: () => setState(
                () => passwordVisibility = !passwordVisibility,
          ),
          child: Icon(
            passwordVisibility
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: const Color(0x98FFFFFF),
            size: 20,
          ),
        ),
      ),
      style: TextStyle(
        fontFamily: 'Lexend Deca',
        color: Theme.of(context).colorScheme.primaryContainer,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      onChanged: (text) {
        if (widget.onChanged != null) {
          widget.onChanged(text);
        }
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cardWidget extends StatefulWidget {
  final String titol;
  final int id;
  final String linkImg;
  final String autor;
  final Function() action;
  final int tag;
  final String content;

  cardWidget({
    super.key,
    required this.titol,
    required this.id,
    required this.linkImg,
    required this.autor,
    required this.action,
    required this.tag,
    required this.content,
  });

  _cardWidget createState() => _cardWidget();
}

class _cardWidget extends State<cardWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Icon icon;
    if (widget.tag == 1) {
      icon = Icon(
        CupertinoIcons.book,
        size: 40,
      );
    } else if (widget.tag == 2) {
      icon = Icon(
        CupertinoIcons.paw,
        size: 40,
      );
    } else {
      icon = Icon(
        CupertinoIcons.circle,
        size: 40,
      );
    }

    return TextButton(
      onPressed: () {
        print('PRESSED');
        widget.action();
      },
      child: Align(
        alignment: AlignmentDirectional(0, 0),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: InkWell(
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(

              width: 310,
              height: 120,
              // Aumenta el espacio vertical para acomodar el nuevo texto

              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.lightBlue, Colors.lightGreenAccent],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.circular(14),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              alignment: AlignmentDirectional(0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.network(
                      widget.linkImg,
                      //'https://picsum.photos/seed/309/600',
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                      alignment: Alignment(0, 0),

                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Text(
                            widget.titol,
                            style: TextStyle(
                              color: Colors.black,

                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          widget.autor,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  icon
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /*Icon returnIcon() {
    if (widget.tag == 1) {
      return Icon(
        CupertinoIcons.book,
        size: 24,
      );
    } else if (widget.tag == 2) {
      return Icon(
        CupertinoIcons.paw,
        size: 24,
      );
    } else {
      return Icon(
        CupertinoIcons.circle,
        size: 24,
      );
    }
  }*/
}

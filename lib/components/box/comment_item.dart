import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  final String commentText;
  final String commentOwner;
  final double paddingLeft;
  final int idComm;
  final Function() storeReply;
  final bool selected;

  const CommentItem({
    required this.commentText,
    required this.commentOwner,
    required this.paddingLeft,
    required this.idComm,
    required this.storeReply,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        storeReply();
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: paddingLeft,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              commentOwner,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selected ? Colors.blue : null,
              ),
            ),
            SizedBox(height: 4),
            Text(
              commentText,
              style: TextStyle(
                color: selected ? Colors.blue : null,
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}



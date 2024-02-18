import 'package:flutter/material.dart';

//int userId = Provider.of<UserData>(context).idUser;
//Provider.of<UserData>(context, listen: false).setUserId(newId);

class UserData extends ChangeNotifier {
  int _idUser = 0;
  int _selectedComment = 0;

  int get idUser => _idUser;
  int get selectedComment => _selectedComment;

  void setUserId(int id) {
    _idUser = id;
    notifyListeners();
  }

  void setSelectedComment(int selectedComment) {
    _selectedComment = selectedComment;
    notifyListeners();
  }
}

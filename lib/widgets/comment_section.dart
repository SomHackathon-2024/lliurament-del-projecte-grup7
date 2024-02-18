import 'package:flutter/material.dart';
import 'package:hack24/components/box/comment_item.dart';
import 'package:hack24/models/obj/user_data.dart';
import 'package:hack24/services/get/comments.dart';
import 'package:hack24/services/post/comments.dart';
import 'package:provider/provider.dart';

class CommentSection extends StatefulWidget {
  final int id;

  CommentSection({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  late Future<List<dynamic>> _futureComments;
  late Future<List<dynamic>> _futureCommentsSon;
  int? selectedCommentId;
  /*int? selectedCommentIdPublication;
  int? selectedCommentIdAnswer;*/

  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    _futureComments = mainComments(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Comments',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: _futureComments,
              builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data![index];

                      int id_comm = data[0] as int;
                      int id_compte = data[1] as int;
                      int id_publicacio = data[2] as int;
                      String comentari = data[3].toString();
                      String nom = data[4].toString();

                      _futureCommentsSon = replyComments(id_comm.toString());

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommentItem(
                            commentText: comentari,
                            commentOwner: nom,
                            paddingLeft: 5,
                            idComm: id_comm,
                            storeReply: () {
                                setState(() {
                                  if (selectedCommentId == id_comm) {
                                    selectedCommentId = null;
                                    //selectedCommentIdPublication = null;
                                    //selectedCommentIdAnswer = null;
                                  } else {
                                    selectedCommentId = id_comm;
                                    //selectedCommentIdPublication = id_publicacio;
                                    //selectedCommentIdAnswer = null;
                                  }
                                });
                            },
                            selected: selectedCommentId == id_comm,
                          ),
                          SizedBox(height: 1),
                          FutureBuilder<List<dynamic>>(
                            future: _futureCommentsSon,
                            builder: (BuildContext pcontext, AsyncSnapshot<List<dynamic>> replySnapshot) {
                              if (replySnapshot.connectionState == ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (replySnapshot.hasError) {
                                return Text('Error: ${replySnapshot.error}');
                              } else {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: replySnapshot.data!.length,
                                  itemBuilder: (context, replyIndex) {
                                    var pdata = replySnapshot.data![replyIndex];

                                    int pid_comm = pdata[0] as int;
                                    int pid_resp = pdata[1] as int;
                                    int pid_compte = pdata[3] as int;
                                    String pcomentari = pdata[2].toString();
                                    int pnivel = pdata[4] as int;
                                    String pnom = pdata[5].toString();

                                    return CommentItem(
                                      commentText: pcomentari,
                                      commentOwner: pnom,
                                      paddingLeft: pnivel * 25,
                                      idComm: pid_comm,
                                      storeReply: () {
                                        setState(() {
                                          if (selectedCommentId == pid_comm) {
                                            selectedCommentId = null;
                                          } else {
                                            selectedCommentId = pid_comm;
                                            //selectedCommentIdPublication = id_publicacio;
                                            //selectedCommentIdAnswer = pid_resp;
                                          }
                                        });
                                        print(selectedCommentId);
                                      },
                                      selected: selectedCommentId == pid_comm,
                                    );
                                  },
                                );
                              }
                            },
                          )
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
          SizedBox(height: 12),
          Divider(),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: textController,
                  //onChanged: NotifyParent,
                  decoration: InputDecoration(
                    hintText: 'Write a comment...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 12),
              ElevatedButton(
                onPressed: () async {
                  if (textController.text.isNotEmpty) { //post the boy
                    int userId = Provider.of<UserData>(context, listen: false).idUser;
                    int idPubli = widget.id;
                    String missatge = textController.text;
                    int idcommnt = selectedCommentId ?? 0;

                    //int idcompte, int idpublicacio, String text, int idresposta
                    var result = await pushComment(userId, idPubli, missatge, idcommnt);
                    print(result);
                    setState(() {
                      selectedCommentId = null;
                    });
                    NotifyParent;
                  }
                },
                child: Text('Send'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  NotifyParent(var content) {
    setState(() {
      content;
    });
  }
}

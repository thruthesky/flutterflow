import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/backend.dart';
import '../components/comment_form_component_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../other_user_profile_screen/other_user_profile_screen_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentBottomSheetMenuComponentWidget extends StatefulWidget {
  const CommentBottomSheetMenuComponentWidget({
    Key key,
    this.commentDocument,
  }) : super(key: key);

  final CommentsRecord commentDocument;

  @override
  _CommentBottomSheetMenuComponentWidgetState createState() =>
      _CommentBottomSheetMenuComponentWidgetState();
}

class _CommentBottomSheetMenuComponentWidgetState
    extends State<CommentBottomSheetMenuComponentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if ((currentUserReference) ==
                (widget.commentDocument.userDocumentReference))
              InkWell(
                onTap: () async {
                  setState(() => FFAppState().temporaryImages = []);
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: CommentFormComponentWidget(
                          commentUpdateDocument: widget.commentDocument,
                        ),
                      );
                    },
                  );
                  Navigator.pop(context);
                },
                child: ListTile(
                  leading: Icon(
                    Icons.mode_edit,
                  ),
                  title: Text(
                    '수정',
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF303030),
                    size: 20,
                  ),
                  tileColor: Color(0xFFF5F5F5),
                  dense: false,
                ),
              ),
            if ((currentUserReference) ==
                (widget.commentDocument.userDocumentReference))
              InkWell(
                onTap: () async {
                  var confirmDialogResponse = await showDialog<bool>(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('코멘트 삭제'),
                            content: Text('정말  삭제하시겠습니까?'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, false),
                                child: Text('아니오'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, true),
                                child: Text('예'),
                              ),
                            ],
                          );
                        },
                      ) ??
                      false;
                  if (confirmDialogResponse) {
                    await widget.commentDocument.reference.delete();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '코멘트가 삭제되었습니다.',
                          style: TextStyle(),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: Color(0x00000000),
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                child: ListTile(
                  leading: Icon(
                    Icons.delete,
                  ),
                  title: Text(
                    '삭제',
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF303030),
                    size: 20,
                  ),
                  tileColor: Color(0xFFF5F5F5),
                  dense: false,
                ),
              ),
            InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtherUserProfileScreenWidget(
                      userDocumentReference:
                          widget.commentDocument.userDocumentReference,
                    ),
                  ),
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.location_history_rounded,
                ),
                title: Text(
                  '프로필 보기',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
            ),
            if (loggedIn ?? true)
              InkWell(
                onTap: () async {
                  final usersUpdateData = {
                    'blockedUsers': FieldValue.arrayUnion(
                        [widget.commentDocument.userDocumentReference]),
                  };
                  await currentUserReference.update(usersUpdateData);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '차단하였습니다.',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      duration: Duration(milliseconds: 4000),
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryColor,
                    ),
                  );
                  Navigator.pop(context);
                },
                child: ListTile(
                  leading: Icon(
                    Icons.block,
                  ),
                  title: Text(
                    '차단하기',
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF303030),
                    size: 20,
                  ),
                  tileColor: Color(0xFFF5F5F5),
                  dense: false,
                ),
              ),
            InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Icon(
                  Icons.close_outlined,
                ),
                title: Text(
                  '닫기',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

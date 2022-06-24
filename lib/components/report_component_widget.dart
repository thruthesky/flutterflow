import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../home_screen/home_screen_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportComponentWidget extends StatefulWidget {
  const ReportComponentWidget({
    Key key,
    this.post,
    this.comment,
  }) : super(key: key);

  final PostsRecord post;
  final CommentsRecord comment;

  @override
  _ReportComponentWidgetState createState() => _ReportComponentWidgetState();
}

class _ReportComponentWidgetState extends State<ReportComponentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 16),
            child: Text(
              '본 글을 신고하시려는 사유를 선택해주세요.',
              style: FlutterFlowTheme.of(context).bodyText1,
            ),
          ),
          InkWell(
            onTap: () async {
              if (functions.postHasValue(widget.post)) {
                final reportsCreateData = createReportsRecordData(
                  reason: '홍보글',
                  postDocumentReference: widget.post.reference,
                  userDocumentReference: widget.post.userDocumentReference,
                );
                await ReportsRecord.collection.doc().set(reportsCreateData);

                final usersUpdateData = {
                  'blockedUsers': FieldValue.arrayUnion(
                      [widget.post.userDocumentReference]),
                };
                await currentUserReference.update(usersUpdateData);
              } else {
                final reportsCreateData = createReportsRecordData(
                  reason: '홍보글',
                  userDocumentReference: widget.comment.userDocumentReference,
                  commentDocumentReference: widget.comment.reference,
                );
                await ReportsRecord.collection.doc().set(reportsCreateData);

                final usersUpdateData = {
                  'blockedUsers': FieldValue.arrayUnion(
                      [widget.comment.userDocumentReference]),
                };
                await currentUserReference.update(usersUpdateData);
              }

              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreenWidget(),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '사용자를 차단하였습니다.',
                    style: TextStyle(),
                  ),
                  duration: Duration(milliseconds: 4000),
                  backgroundColor: Color(0x00000000),
                ),
              );
            },
            child: ListTile(
              leading: FaIcon(
                FontAwesomeIcons.ad,
              ),
              title: Text(
                '부적절한 홍보 글',
                style: FlutterFlowTheme.of(context).subtitle1,
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
              if (functions.postHasValue(widget.post)) {
                final reportsCreateData = createReportsRecordData(
                  reason: '음란성 또는 미풍양속을 해치는 글',
                  postDocumentReference: widget.post.reference,
                  userDocumentReference: widget.post.userDocumentReference,
                );
                await ReportsRecord.collection.doc().set(reportsCreateData);

                final usersUpdateData = {
                  'blockedUsers': FieldValue.arrayUnion(
                      [widget.post.userDocumentReference]),
                };
                await currentUserReference.update(usersUpdateData);
              } else {
                final reportsCreateData = createReportsRecordData(
                  reason: '음란성 또는 미풍양속을 해치는 글',
                  userDocumentReference: widget.comment.userDocumentReference,
                  commentDocumentReference: widget.comment.reference,
                );
                await ReportsRecord.collection.doc().set(reportsCreateData);

                final usersUpdateData = {
                  'blockedUsers': FieldValue.arrayUnion(
                      [widget.comment.userDocumentReference]),
                };
                await currentUserReference.update(usersUpdateData);
              }

              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreenWidget(),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '사용자를 차단하였습니다.',
                    style: TextStyle(),
                  ),
                  duration: Duration(milliseconds: 4000),
                  backgroundColor: Color(0x00000000),
                ),
              );
            },
            child: ListTile(
              leading: FaIcon(
                FontAwesomeIcons.solidImage,
              ),
              title: Text(
                '음란성 또는 미풍양속을 해치는 글',
                style: FlutterFlowTheme.of(context).subtitle1,
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
              if (functions.postHasValue(widget.post)) {
                final reportsCreateData = createReportsRecordData(
                  reason: '명예훼손 또는 저작권 침해',
                  postDocumentReference: widget.post.reference,
                  userDocumentReference: widget.post.userDocumentReference,
                );
                await ReportsRecord.collection.doc().set(reportsCreateData);

                final usersUpdateData = {
                  'blockedUsers': FieldValue.arrayUnion(
                      [widget.post.userDocumentReference]),
                };
                await currentUserReference.update(usersUpdateData);
              } else {
                final reportsCreateData = createReportsRecordData(
                  reason: '명예훼손 또는 저작권 침해',
                  userDocumentReference: widget.comment.userDocumentReference,
                  commentDocumentReference: widget.comment.reference,
                );
                await ReportsRecord.collection.doc().set(reportsCreateData);

                final usersUpdateData = {
                  'blockedUsers': FieldValue.arrayUnion(
                      [widget.comment.userDocumentReference]),
                };
                await currentUserReference.update(usersUpdateData);
              }

              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreenWidget(),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '사용자를 차단하였습니다.',
                    style: TextStyle(),
                  ),
                  duration: Duration(milliseconds: 4000),
                  backgroundColor: Color(0x00000000),
                ),
              );
            },
            child: ListTile(
              leading: FaIcon(
                FontAwesomeIcons.copyright,
              ),
              title: Text(
                '명예훼손 또는 저작권 침해',
                style: FlutterFlowTheme.of(context).title3,
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
          Align(
            alignment: AlignmentDirectional(1, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.cancel_rounded,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

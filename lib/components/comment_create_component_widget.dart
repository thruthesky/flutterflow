import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentCreateComponentWidget extends StatefulWidget {
  const CommentCreateComponentWidget({
    Key key,
    this.postDocumentReference,
    this.depth,
    this.order,
    this.commentDocumentReference,
    this.noOfComments,
  }) : super(key: key);

  final DocumentReference postDocumentReference;
  final int depth;
  final String order;
  final DocumentReference commentDocumentReference;
  final int noOfComments;

  @override
  _CommentCreateComponentWidgetState createState() =>
      _CommentCreateComponentWidgetState();
}

class _CommentCreateComponentWidgetState
    extends State<CommentCreateComponentWidget> {
  CommentsRecord newComment;
  TextEditingController commentTextFieldController;

  @override
  void initState() {
    super.initState();
    commentTextFieldController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PostsRecord>(
      stream: PostsRecord.getDocument(widget.postDocumentReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final containerPostsRecord = snapshot.data;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 32, 16, 16),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: commentTextFieldController,
                    onChanged: (_) => EasyDebounce.debounce(
                      'commentTextFieldController',
                      Duration(milliseconds: 2000),
                      () => setState(() {}),
                    ),
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: '댓글 내용',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFCECECE),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFCECECE),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                        ),
                    maxLines: 6,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                            text: '취소',
                            options: FFButtonOptions(
                              width: 80,
                              height: 40,
                              color: Colors.transparent,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF4F4F4F),
                                    fontWeight: FontWeight.w600,
                                  ),
                              elevation: 0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 0,
                              ),
                              borderRadius: 12,
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              final commentsCreateData =
                                  createCommentsRecordData(
                                content: commentTextFieldController.text,
                                userDocumentReference: currentUserReference,
                                postDocumentReference:
                                    widget.postDocumentReference,
                                createdAt: getCurrentTimestamp,
                                order: functions.getCommentOrder(
                                    widget.noOfComments,
                                    widget.order,
                                    widget.depth),
                                depth: functions.increaseInteger(widget.depth),
                                noOfComments: 0,
                              );
                              var commentsRecordReference =
                                  CommentsRecord.collection.doc();
                              await commentsRecordReference
                                  .set(commentsCreateData);
                              newComment = CommentsRecord.getDocumentFromData(
                                  commentsCreateData, commentsRecordReference);

                              final postsUpdateData = {
                                'noOfComments': FieldValue.increment(1),
                              };
                              await widget.postDocumentReference
                                  .update(postsUpdateData);
                              if ((widget.commentDocumentReference != null)) {
                                final commentsUpdateData = {
                                  'noOfComments': FieldValue.increment(1),
                                };
                                await widget.commentDocumentReference
                                    .update(commentsUpdateData);
                              }
                              Navigator.pop(context);

                              setState(() {});
                            },
                            text: '저장',
                            options: FFButtonOptions(
                              width: 80,
                              height: 40,
                              color: Colors.transparent,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                              elevation: 0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 0,
                              ),
                              borderRadius: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

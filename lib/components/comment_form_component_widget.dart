import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentFormComponentWidget extends StatefulWidget {
  const CommentFormComponentWidget({
    Key key,
    this.postDocument,
    this.commentParentDocument,
    this.commentUpdateDocument,
  }) : super(key: key);

  final PostsRecord postDocument;
  final CommentsRecord commentParentDocument;
  final CommentsRecord commentUpdateDocument;

  @override
  _CommentFormComponentWidgetState createState() =>
      _CommentFormComponentWidgetState();
}

class _CommentFormComponentWidgetState
    extends State<CommentFormComponentWidget> {
  String uploadedFileUrl = '';
  TextEditingController commentTextFieldController;

  @override
  void initState() {
    super.initState();
    commentTextFieldController = TextEditingController(
        text: functions.getCommentContent(widget.commentUpdateDocument));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (loggedIn ?? true)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 32, 16, 16),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
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
                    if (!(functions.isListImagePathEmpty(
                            FFAppState().temporaryImages.toList())) ??
                        true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final imagePathFromTemporaryImages =
                                  FFAppState().temporaryImages?.toList() ?? [];
                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 1,
                                ),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: imagePathFromTemporaryImages.length,
                                itemBuilder: (context,
                                    imagePathFromTemporaryImagesIndex) {
                                  final imagePathFromTemporaryImagesItem =
                                      imagePathFromTemporaryImages[
                                          imagePathFromTemporaryImagesIndex];
                                  return Stack(
                                    children: [
                                      Image.network(
                                        imagePathFromTemporaryImagesItem,
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30,
                                        borderWidth: 1,
                                        buttonSize: 60,
                                        icon: Icon(
                                          Icons.delete_forever,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          size: 30,
                                        ),
                                        onPressed: () async {
                                          await actions.deleteImage(
                                            imagePathFromTemporaryImagesItem,
                                          );
                                          setState(() => FFAppState()
                                              .temporaryImages
                                              .remove(
                                                  imagePathFromTemporaryImagesItem));
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    if (!(functions
                            .isCommentEmpty(widget.commentUpdateDocument)) ??
                        true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: StreamBuilder<CommentsRecord>(
                          stream: CommentsRecord.getDocument(
                              widget.commentUpdateDocument.reference),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            final commentUpdateUploadCommentsRecord =
                                snapshot.data;
                            return Container(
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  final imagePathFromLiveComment =
                                      commentUpdateUploadCommentsRecord.images
                                              .toList()
                                              ?.toList() ??
                                          [];
                                  return GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: 1,
                                    ),
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: imagePathFromLiveComment.length,
                                    itemBuilder: (context,
                                        imagePathFromLiveCommentIndex) {
                                      final imagePathFromLiveCommentItem =
                                          imagePathFromLiveComment[
                                              imagePathFromLiveCommentIndex];
                                      return Stack(
                                        children: [
                                          Image.network(
                                            imagePathFromLiveCommentItem,
                                            width: 200,
                                            height: 200,
                                            fit: BoxFit.cover,
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            borderWidth: 1,
                                            buttonSize: 60,
                                            icon: Icon(
                                              Icons.delete_forever,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 30,
                                            ),
                                            onPressed: () async {
                                              await actions.deleteImage(
                                                imagePathFromLiveCommentItem,
                                              );

                                              final commentsUpdateData = {
                                                'images':
                                                    FieldValue.arrayRemove([
                                                  imagePathFromLiveCommentItem
                                                ]),
                                              };
                                              await widget.commentUpdateDocument
                                                  .reference
                                                  .update(commentsUpdateData);
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: Icon(
                            Icons.photo_camera,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30,
                          ),
                          onPressed: () async {
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              maxWidth: 1024.00,
                              maxHeight: 2048.00,
                              allowPhoto: true,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              showUploadMessage(
                                context,
                                '사진을 업로드 중입니다.',
                                showLoading: true,
                              );
                              final downloadUrls = (await Future.wait(
                                      selectedMedia.map((m) async =>
                                          await uploadData(
                                              m.storagePath, m.bytes))))
                                  .where((u) => u != null)
                                  .toList();
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              if (downloadUrls != null &&
                                  downloadUrls.length == selectedMedia.length) {
                                setState(
                                    () => uploadedFileUrl = downloadUrls.first);
                                showUploadMessage(
                                  context,
                                  '사진을 업로드 하였습니다.',
                                );
                              } else {
                                showUploadMessage(
                                  context,
                                  'Failed to upload media',
                                );
                                return;
                              }
                            }

                            if (functions
                                .isCommentEmpty(widget.commentUpdateDocument)) {
                              setState(() => FFAppState()
                                  .temporaryImages
                                  .add(uploadedFileUrl));
                            } else {
                              final commentsUpdateData = {
                                'images':
                                    FieldValue.arrayUnion([uploadedFileUrl]),
                              };
                              await widget.commentUpdateDocument.reference
                                  .update(commentsUpdateData);
                            }
                          },
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                if (functions.isCommentEmpty(
                                    widget.commentUpdateDocument)) {
                                  if (functions.isCommentEmpty(
                                      widget.commentParentDocument)) {
                                    final commentsCreateData = {
                                      ...createCommentsRecordData(
                                        content:
                                            commentTextFieldController.text,
                                        userDocumentReference:
                                            currentUserReference,
                                        postDocumentReference:
                                            widget.postDocument.reference,
                                        createdAt: getCurrentTimestamp,
                                        order: functions.getCommentOrder(
                                            widget.postDocument.noOfComments,
                                            functions.emptyString(),
                                            0),
                                        depth: 1,
                                        noOfComments: 0,
                                      ),
                                      'images': FFAppState().temporaryImages,
                                    };
                                    await CommentsRecord.collection
                                        .doc()
                                        .set(commentsCreateData);

                                    final postsUpdateData = {
                                      'noOfComments': FieldValue.increment(1),
                                    };
                                    await widget.postDocument.reference
                                        .update(postsUpdateData);
                                    Navigator.pop(context);
                                    return;
                                  } else {
                                    final commentsCreateData = {
                                      ...createCommentsRecordData(
                                        content:
                                            commentTextFieldController.text,
                                        userDocumentReference:
                                            currentUserReference,
                                        postDocumentReference:
                                            widget.postDocument.reference,
                                        createdAt: getCurrentTimestamp,
                                        order: functions.getCommentOrder(
                                            widget.commentParentDocument
                                                .noOfComments,
                                            widget.commentParentDocument.order,
                                            widget.commentParentDocument.depth),
                                        depth: functions.increaseInteger(
                                            widget.commentParentDocument.depth),
                                        noOfComments: 0,
                                      ),
                                      'images': FFAppState().temporaryImages,
                                    };
                                    await CommentsRecord.collection
                                        .doc()
                                        .set(commentsCreateData);

                                    final postsUpdateData = {
                                      'noOfComments': FieldValue.increment(1),
                                    };
                                    await widget.postDocument.reference
                                        .update(postsUpdateData);

                                    final commentsUpdateData = {
                                      'noOfComments': FieldValue.increment(1),
                                    };
                                    await widget.commentParentDocument.reference
                                        .update(commentsUpdateData);
                                    Navigator.pop(context);
                                    return;
                                  }
                                } else {
                                  final commentsUpdateData =
                                      createCommentsRecordData(
                                    content: commentTextFieldController.text,
                                  );
                                  await widget.commentUpdateDocument.reference
                                      .update(commentsUpdateData);
                                  Navigator.pop(context);
                                  return;
                                }
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
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          if (!(loggedIn) ?? true)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '앗, 회원 로그인을 먼저 해 주세요.',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        text: '닫기',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: Colors.transparent,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                          elevation: 0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                          borderRadius: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

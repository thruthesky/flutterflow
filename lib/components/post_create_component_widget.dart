import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../post_view_screen/post_view_screen_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostCreateComponentWidget extends StatefulWidget {
  const PostCreateComponentWidget({
    Key key,
    this.category,
  }) : super(key: key);

  final String category;

  @override
  _PostCreateComponentWidgetState createState() =>
      _PostCreateComponentWidgetState();
}

class _PostCreateComponentWidgetState extends State<PostCreateComponentWidget> {
  PostsRecord justPosted;
  String uploadedFileUrl = '';
  String categoryDropDownValue;
  TextEditingController titleTextFieldController;
  TextEditingController contentTextFieldController;

  @override
  void initState() {
    super.initState();
    contentTextFieldController = TextEditingController();
    titleTextFieldController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
          ),
          child: FlutterFlowDropDown(
            initialOption: categoryDropDownValue ??= widget.category,
            options: ['자유게시판', '질문게시판', '공지사항'],
            onChanged: (val) => setState(() => categoryDropDownValue = val),
            width: 180,
            height: 50,
            textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
            hintText: '게시판 카테고리 선택',
            fillColor: Colors.white,
            elevation: 2,
            borderColor: Color(0xFFBBBBBB),
            borderWidth: 0,
            borderRadius: 0,
            margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
            hidesUnderline: true,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
          child: TextFormField(
            controller: titleTextFieldController,
            onChanged: (_) => EasyDebounce.debounce(
              'titleTextFieldController',
              Duration(milliseconds: 2000),
              () => setState(() {}),
            ),
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              labelText: '제목',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).secondaryText,
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).secondaryText,
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
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
          child: TextFormField(
            controller: contentTextFieldController,
            onChanged: (_) => EasyDebounce.debounce(
              'contentTextFieldController',
              Duration(milliseconds: 2000),
              () => setState(() {}),
            ),
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              labelText: '내용',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).secondaryText,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).secondaryText,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(0),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
            ),
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                ),
            maxLines: 10,
          ),
        ),
        if (functions
                .hasTemporaryImages(FFAppState().temporaryImages.toList()) ??
            true)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
              ),
              child: Builder(
                builder: (context) {
                  final uploadedImages =
                      FFAppState().temporaryImages?.toList() ?? [];
                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: uploadedImages.length,
                    itemBuilder: (context, uploadedImagesIndex) {
                      final uploadedImagesItem =
                          uploadedImages[uploadedImagesIndex];
                      return Stack(
                        children: [
                          Image.network(
                            uploadedImagesItem,
                            width: MediaQuery.of(context).size.width * 0.333,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: Icon(
                              Icons.delete_forever,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 30,
                            ),
                            onPressed: () async {
                              await actions.deleteImage(
                                uploadedImagesItem,
                              );
                              setState(() => FFAppState()
                                  .temporaryImages
                                  .remove(uploadedImagesItem));
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
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.photo_camera,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () async {
                final selectedMedia = await selectMediaWithSourceBottomSheet(
                  context: context,
                  maxWidth: 1024.00,
                  maxHeight: 2048.00,
                  imageQuality: 100,
                  allowPhoto: true,
                );
                if (selectedMedia != null &&
                    selectedMedia.every(
                        (m) => validateFileFormat(m.storagePath, context))) {
                  showUploadMessage(
                    context,
                    '사진을 업로드 중입니다.',
                    showLoading: true,
                  );
                  final downloadUrls = (await Future.wait(selectedMedia.map(
                          (m) async =>
                              await uploadData(m.storagePath, m.bytes))))
                      .where((u) => u != null)
                      .toList();
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  if (downloadUrls != null &&
                      downloadUrls.length == selectedMedia.length) {
                    setState(() => uploadedFileUrl = downloadUrls.first);
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

                setState(
                    () => FFAppState().temporaryImages.add(uploadedFileUrl));
              },
            ),
            FFButtonWidget(
              onPressed: () async {
                final postsCreateData = {
                  ...createPostsRecordData(
                    title: titleTextFieldController.text,
                    contente: contentTextFieldController.text,
                    userDocumentReference: currentUserReference,
                    timestamp: getCurrentTimestamp,
                    category: categoryDropDownValue,
                    hasPhoto: !(functions.isListImagePathEmpty(
                        FFAppState().temporaryImages.toList())),
                  ),
                  'images': FFAppState().temporaryImages,
                };
                var postsRecordReference = PostsRecord.collection.doc();
                await postsRecordReference.set(postsCreateData);
                justPosted = PostsRecord.getDocumentFromData(
                    postsCreateData, postsRecordReference);
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostViewScreenWidget(
                      postReference: justPosted.reference,
                    ),
                  ),
                );

                setState(() {});
              },
              text: '글 작성하기',
              options: FFButtonOptions(
                width: 120,
                height: 40,
                color: FlutterFlowTheme.of(context).primaryColor,
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                elevation: 0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 0,
                ),
                borderRadius: 3,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

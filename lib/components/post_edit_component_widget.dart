import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
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

class PostEditComponentWidget extends StatefulWidget {
  const PostEditComponentWidget({
    Key key,
    this.postReference,
  }) : super(key: key);

  final DocumentReference postReference;

  @override
  _PostEditComponentWidgetState createState() =>
      _PostEditComponentWidgetState();
}

class _PostEditComponentWidgetState extends State<PostEditComponentWidget> {
  String uploadedFileUrl = '';
  TextEditingController contentTextFieldController;
  TextEditingController titleTextFieldController;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PostsRecord>(
      stream: PostsRecord.getDocument(widget.postReference),
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
        final columnPostsRecord = snapshot.data;
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TextFormField(
              controller: titleTextFieldController ??= TextEditingController(
                text: columnPostsRecord.title,
              ),
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: TextFormField(
                controller: contentTextFieldController ??=
                    TextEditingController(
                  text: columnPostsRecord.content,
                ),
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
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                    ),
                maxLines: 10,
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
              ),
            ),
            if (functions.hasPostPhoto(columnPostsRecord) ?? true)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Builder(
                    builder: (context) {
                      final uploadedImages =
                          columnPostsRecord.images.toList()?.toList() ?? [];
                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
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
                                width: 100,
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

                                  final postsUpdateData = {
                                    'images': FieldValue.arrayRemove(
                                        [uploadedImagesItem]),
                                  };
                                  await widget.postReference
                                      .update(postsUpdateData);
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
                    final selectedMedia =
                        await selectMediaWithSourceBottomSheet(
                      context: context,
                      maxWidth: 1024.00,
                      maxHeight: 2048.00,
                      allowPhoto: true,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
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

                    final postsUpdateData = {
                      'images': FieldValue.arrayUnion([uploadedFileUrl]),
                    };
                    await widget.postReference.update(postsUpdateData);
                  },
                ),
                FFButtonWidget(
                  onPressed: () async {
                    final postsUpdateData = createPostsRecordData(
                      title: titleTextFieldController?.text ?? '',
                      hasPhoto: !(functions.isListImagePathEmpty(
                          columnPostsRecord.images.toList())),
                      content: contentTextFieldController?.text ?? '',
                    );
                    await widget.postReference.update(postsUpdateData);
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostViewScreenWidget(
                          postReference: widget.postReference,
                        ),
                      ),
                    );
                  },
                  text: '글 작성하기',
                  options: FFButtonOptions(
                    width: 120,
                    height: 40,
                    color: Colors.transparent,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
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
        );
      },
    );
  }
}

import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/backend.dart';
import '../components/app_header_component_widget.dart';
import '../components/comment_form_component_widget.dart';
import '../components/comment_list_component_widget.dart';
import '../components/end_drawer_column_widget.dart';
import '../components/post_bottom_sheet_menu_component_widget.dart';
import '../components/report_component_widget.dart';
import '../components/user_photo_component_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../post_list_screen/post_list_screen_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostViewScreenWidget extends StatefulWidget {
  const PostViewScreenWidget({
    Key key,
    this.postReference,
  }) : super(key: key);

  final DocumentReference postReference;

  @override
  _PostViewScreenWidgetState createState() => _PostViewScreenWidgetState();
}

class _PostViewScreenWidgetState extends State<PostViewScreenWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
        final postViewScreenPostsRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          endDrawer: Drawer(
            elevation: 16,
            child: EndDrawerColumnWidget(),
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x00EEEEEE),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 48,
                              icon: Icon(
                                Icons.chevron_left,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 28,
                              ),
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PostListScreenWidget(
                                      category:
                                          postViewScreenPostsRecord.category,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: AppHeaderComponentWidget(
                              category: postViewScreenPostsRecord.category,
                              displaySearchIcon: false,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 32,
                        thickness: 1,
                        color: Color(0xFFD8D8D8),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    UserPhotoComponentWidget(
                                      user: postViewScreenPostsRecord
                                          .userDocumentReference,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              postViewScreenPostsRecord.title,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: Text(
                                                dateTimeFormat(
                                                    'M/d h:mm a',
                                                    postViewScreenPostsRecord
                                                        .timestamp),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                if (functions.hasPostPhoto(
                                        postViewScreenPostsRecord) ??
                                    true)
                                  Builder(
                                    builder: (context) {
                                      final columnItemImage =
                                          postViewScreenPostsRecord.images
                                                  .toList()
                                                  ?.toList() ??
                                              [];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            columnItemImage.length,
                                            (columnItemImageIndex) {
                                          final columnItemImageItem =
                                              columnItemImage[
                                                  columnItemImageIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 16, 0, 0),
                                            child: Image.network(
                                              columnItemImageItem,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 32, 0, 0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE8E8E8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 16, 16),
                                      child: Text(
                                        postViewScreenPostsRecord.content,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            if (loggedIn) {
                                              if (postViewScreenPostsRecord
                                                  .likes
                                                  .toList()
                                                  .contains(
                                                      currentUserReference)) {
                                                final postsUpdateData = {
                                                  'likes':
                                                      FieldValue.arrayRemove([
                                                    currentUserReference
                                                  ]),
                                                };
                                                await postViewScreenPostsRecord
                                                    .reference
                                                    .update(postsUpdateData);
                                              } else {
                                                final postsUpdateData = {
                                                  'likes':
                                                      FieldValue.arrayUnion([
                                                    currentUserReference
                                                  ]),
                                                };
                                                await postViewScreenPostsRecord
                                                    .reference
                                                    .update(postsUpdateData);
                                              }
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    '로그인을 먼저 해 주세요.',
                                                    style: TextStyle(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 10000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                ),
                                              );
                                            }
                                          },
                                          text: functions.likeText(
                                              postViewScreenPostsRecord.likes
                                                  .toList()),
                                          options: FFButtonOptions(
                                            width: 72,
                                            height: 40,
                                            color: Color(0x004B39EF),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Color(0xFF050505),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            elevation: 0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 0,
                                            ),
                                            borderRadius: 0,
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            if (loggedIn) {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child:
                                                        ReportComponentWidget(
                                                      post:
                                                          postViewScreenPostsRecord,
                                                    ),
                                                  );
                                                },
                                              );
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    '로그인을 먼저 해 주세요.',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      Color(0xFF9F0000),
                                                ),
                                              );
                                            }
                                          },
                                          text: '신고',
                                          options: FFButtonOptions(
                                            width: 60,
                                            height: 40,
                                            color: Color(0x004B39EF),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
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
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 60,
                                      icon: Icon(
                                        Icons.more_vert,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                      onPressed: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child:
                                                  PostBottomSheetMenuComponentWidget(
                                                post: postViewScreenPostsRecord,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () async {
                                    setState(() =>
                                        FFAppState().temporaryImages = []);
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: CommentFormComponentWidget(
                                            postDocument:
                                                postViewScreenPostsRecord,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 52,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3),
                                      border: Border.all(
                                        color: Color(0xFFD3D3D3),
                                        width: 1,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 16, 16),
                                      child: Text(
                                        '덧 글 쓰기 ...',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                        ),
                        child: CommentListComponentWidget(
                          postDocumentReference:
                              postViewScreenPostsRecord.reference,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

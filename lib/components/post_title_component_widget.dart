import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../post_view_screen/post_view_screen_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostTitleComponentWidget extends StatefulWidget {
  const PostTitleComponentWidget({
    Key key,
    this.post,
  }) : super(key: key);

  final PostsRecord post;

  @override
  _PostTitleComponentWidgetState createState() =>
      _PostTitleComponentWidgetState();
}

class _PostTitleComponentWidgetState extends State<PostTitleComponentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0x00FFFFFF),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!((currentUserDocument?.blockedUsers?.toList() ?? [])
                  .contains(widget.post.userDocumentReference)) ??
              true)
            AuthUserStreamWidget(
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostViewScreenWidget(
                        postReference: widget.post.reference,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0x00FFFFFF),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: Color(0x00FFFFFF),
                            shape: BoxShape.circle,
                          ),
                          child: FutureBuilder<UsersRecord>(
                            future: UsersRecord.getDocumentOnce(
                                widget.post.userDocumentReference),
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
                              final circleImageUsersRecord = snapshot.data;
                              return Container(
                                width: 42,
                                height: 42,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    circleImageUsersRecord.photoUrl,
                                    'https://firebasestorage.googleapis.com/v0/b/flutter-flow-korea.appspot.com/o/app-assets%2Fpro-3-Untitled-1.png?alt=media&token=c201475d-1f06-4674-a91b-f80ddaf7358e',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.post.title.maybeHandleOverflow(
                                    maxChars: 18,
                                    replacement: '…',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  functions
                                      .oneLineString(widget.post.contente)
                                      .maybeHandleOverflow(
                                        maxChars: 22,
                                        replacement: '…',
                                      ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.black,
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          if ((currentUserDocument?.blockedUsers?.toList() ?? [])
                  ?.contains(widget.post.userDocumentReference) ??
              true)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(32, 32, 32, 32),
              child: AuthUserStreamWidget(
                child: Text(
                  '차단된 회원의 글입니다.',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

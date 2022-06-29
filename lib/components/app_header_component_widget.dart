import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../my_post_list_screen/my_post_list_screen_widget.dart';
import '../post_create_screen/post_create_screen_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppHeaderComponentWidget extends StatefulWidget {
  const AppHeaderComponentWidget({
    Key key,
    this.category,
    this.displaySearchIcon,
  }) : super(key: key);

  final String category;
  final bool displaySearchIcon;

  @override
  _AppHeaderComponentWidgetState createState() =>
      _AppHeaderComponentWidgetState();
}

class _AppHeaderComponentWidgetState extends State<AppHeaderComponentWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.transparent,
                ),
              ),
              child: AuthUserStreamWidget(
                child: Container(
                  width: 54,
                  height: 54,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: valueOrDefault<String>(
                      currentUserPhoto,
                      'https://firebasestorage.googleapis.com/v0/b/flutter-flow-korea.appspot.com/o/app-assets%2Fnew-anonymous.png?alt=media&token=a548ff66-026d-4a16-b0dd-5187b8c7ca04',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthUserStreamWidget(
                      child: Text(
                        valueOrDefault<String>(
                          currentUserDisplayName,
                          '노 코드 앱 개발',
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ),
                    if (!(loggedIn) ?? true)
                      Text(
                        '환영합니다. 로그인을 해 주세요.',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyPostListScreenWidget(),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Visibility(
                            visible: loggedIn ?? true,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.bookmarks_sharp,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 16,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 0, 0),
                                  child: Text(
                                    '나의 글',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 50,
              icon: Icon(
                Icons.create_sharp,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30,
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostCreateScreenWidget(
                      category: widget.category,
                    ),
                  ),
                );
              },
            ),
            if (widget.displaySearchIcon ?? true)
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 50,
                icon: Icon(
                  Icons.search_sharp,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30,
                ),
                onPressed: () async {
                  final usersUpdateData = createUsersRecordData(
                    optionDisplaySearch: !(valueOrDefault(
                        currentUserDocument?.optionDisplaySearch, false)),
                  );
                  await currentUserReference.update(usersUpdateData);
                },
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 50,
                icon: Icon(
                  Icons.menu_sharp,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () async {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

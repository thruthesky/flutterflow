import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../entry_screen/entry_screen_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../home_screen/home_screen_widget.dart';
import '../post_create_screen/post_create_screen_widget.dart';
import '../post_list_screen/post_list_screen_widget.dart';
import '../profile_screen/profile_screen_widget.dart';
import '../sign_in_screen/sign_in_screen_widget.dart';
import '../user_block_list_screen/user_block_list_screen_widget.dart';
import '../user_license_agreement_screen/user_license_agreement_screen_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EndDrawerColumnWidget extends StatefulWidget {
  const EndDrawerColumnWidget({Key key}) : super(key: key);

  @override
  _EndDrawerColumnWidgetState createState() => _EndDrawerColumnWidgetState();
}

class _EndDrawerColumnWidgetState extends State<EndDrawerColumnWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
              child: InkWell(
                onTap: () async {
                  if (loggedIn) {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreenWidget(),
                      ),
                    );
                  } else {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreenWidget(),
                      ),
                    );
                  }
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 64, 0, 0),
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color(0xFFD7D7D7),
                          shape: BoxShape.circle,
                        ),
                        child: AuthUserStreamWidget(
                          child: Container(
                            width: 120,
                            height: 120,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: CachedNetworkImage(
                              imageUrl: valueOrDefault<String>(
                                currentUserPhoto,
                                'https://firebasestorage.googleapis.com/v0/b/flutter-flow-korea.appspot.com/o/app-assets%2Fpro-3-Untitled-1.png?alt=media&token=c201475d-1f06-4674-a91b-f80ddaf7358e',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (loggedIn ?? true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: AuthUserStreamWidget(
                          child: Text(
                            valueOrDefault<String>(
                              currentUserDisplayName,
                              '회원 정보 업데이트',
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                      ),
                    if (!(loggedIn) ?? true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Text(
                          '앗, 로그인을 해 주세요.',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Divider(
            height: 32,
          ),
          InkWell(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreenWidget(),
                ),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: Text(
                '홈',
                style: FlutterFlowTheme.of(context).title3,
              ),
              subtitle: Text(
                '홈 스크린으로 이동',
                style: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF303030),
                size: 20,
              ),
              tileColor: Color(0x00F5F5F5),
              dense: false,
            ),
          ),
          InkWell(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostCreateScreenWidget(
                    category: '자유게시판',
                  ),
                ),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.create_sharp,
              ),
              title: Text(
                '글 쓰기',
                style: FlutterFlowTheme.of(context).title3,
              ),
              subtitle: Text(
                '새로운 글 작성',
                style: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF303030),
                size: 20,
              ),
              tileColor: Color(0x00F5F5F5),
              dense: false,
            ),
          ),
          Divider(
            height: 32,
          ),
          InkWell(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostListScreenWidget(
                    category: '가입인사',
                  ),
                ),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.hail,
              ),
              title: Text(
                '가입인사',
                style: FlutterFlowTheme.of(context).title3.override(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF303030),
                size: 20,
              ),
              tileColor: Colors.transparent,
              dense: false,
            ),
          ),
          InkWell(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostListScreenWidget(
                    category: '질문게시판',
                  ),
                ),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.help_rounded,
              ),
              title: Text(
                '질문게시판',
                style: FlutterFlowTheme.of(context).title3.override(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF303030),
                size: 20,
              ),
              tileColor: Colors.transparent,
              dense: false,
            ),
          ),
          InkWell(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostListScreenWidget(
                    category: '자유게시판',
                  ),
                ),
              );
            },
            child: ListTile(
              leading: FaIcon(
                FontAwesomeIcons.solidCommentAlt,
              ),
              title: Text(
                '자유게시판',
                style: FlutterFlowTheme.of(context).title3.override(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF303030),
                size: 20,
              ),
              tileColor: Colors.transparent,
              dense: false,
            ),
          ),
          InkWell(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostListScreenWidget(
                    category: '플러터플로 팁',
                  ),
                ),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.info_outline_rounded,
              ),
              title: Text(
                '플러터플로 팁',
                style: FlutterFlowTheme.of(context).title3.override(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF303030),
                size: 20,
              ),
              tileColor: Colors.transparent,
              dense: false,
            ),
          ),
          InkWell(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostListScreenWidget(
                    category: '공지사항',
                  ),
                ),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.content_paste,
              ),
              title: Text(
                '공지사항',
                style: FlutterFlowTheme.of(context).title3.override(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF303030),
                size: 20,
              ),
              tileColor: Colors.transparent,
              dense: false,
            ),
          ),
          InkWell(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostListScreenWidget(
                    category: functions.emptyString(),
                  ),
                ),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.insert_comment_sharp,
              ),
              title: Text(
                '전체 글 보기',
                style: FlutterFlowTheme.of(context).title3.override(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF303030),
                size: 20,
              ),
              tileColor: Colors.transparent,
              dense: false,
            ),
          ),
          Divider(
            height: 32,
          ),
          if (loggedIn ?? true)
            InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserLicenseAgreementScreenWidget(),
                  ),
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.library_books_sharp,
                ),
                title: Text(
                  '회원 가입 약관',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: Color(0x00F5F5F5),
                dense: false,
              ),
            ),
          if (!(loggedIn) ?? true)
            InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInScreenWidget(),
                  ),
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.login_sharp,
                ),
                title: Text(
                  '로그인',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: Color(0x00F5F5F5),
                dense: false,
              ),
            ),
          if (loggedIn ?? true)
            InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserBlockListScreenWidget(),
                  ),
                );
              },
              child: ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.usersSlash,
                  size: 18,
                ),
                title: Text(
                  '차단한 사용자 목록',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: Color(0x00F5F5F5),
                dense: false,
              ),
            ),
          if (loggedIn ?? true)
            InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreenWidget(),
                  ),
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.location_history_sharp,
                ),
                title: Text(
                  '회원 정보 수정',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: Color(0x00F5F5F5),
                dense: false,
              ),
            ),
          if (loggedIn ?? true)
            InkWell(
              onTap: () async {
                await signOut();
                await Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EntryScreenWidget(),
                  ),
                  (r) => false,
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                ),
                title: Text(
                  '로그아웃',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: Color(0x00F5F5F5),
                dense: false,
              ),
            ),
        ],
      ),
    );
  }
}

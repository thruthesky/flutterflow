import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/user_photo_component_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_screen/home_screen_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserBlockListScreenWidget extends StatefulWidget {
  const UserBlockListScreenWidget({Key key}) : super(key: key);

  @override
  _UserBlockListScreenWidgetState createState() =>
      _UserBlockListScreenWidgetState();
}

class _UserBlockListScreenWidgetState extends State<UserBlockListScreenWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            await Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreenWidget(),
              ),
              (r) => false,
            );
          },
          child: Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 36,
          ),
        ),
        title: Text(
          '차단한 사용자 목록',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: AuthUserStreamWidget(
            child: Builder(
              builder: (context) {
                final blockedUsers =
                    (currentUserDocument?.blockedUsers?.toList() ?? [])
                            ?.toList() ??
                        [];
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: blockedUsers.length,
                  itemBuilder: (context, blockedUsersIndex) {
                    final blockedUsersItem = blockedUsers[blockedUsersIndex];
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: FutureBuilder<UsersRecord>(
                        future: UsersRecord.getDocumentOnce(blockedUsersItem),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          final containerUsersRecord = snapshot.data;
                          return Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                UserPhotoComponentWidget(
                                  user: blockedUsersItem,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 0, 0),
                                  child: Text(
                                    containerUsersRecord.displayName,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                                Spacer(),
                                FFButtonWidget(
                                  onPressed: () async {
                                    final usersUpdateData = {
                                      'blocked_users': FieldValue.arrayRemove(
                                          [containerUsersRecord.reference]),
                                    };
                                    await currentUserReference
                                        .update(usersUpdateData);
                                    await Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            HomeScreenWidget(),
                                      ),
                                      (r) => false,
                                    );
                                  },
                                  text: '차단해제',
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 40,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 12,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

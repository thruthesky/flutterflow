import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../components/post_create_component_widget.dart';
import '../components/sign_in_button_component_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class PostCreateScreenWidget extends StatefulWidget {
  const PostCreateScreenWidget({
    Key key,
    this.category,
  }) : super(key: key);

  final String category;

  @override
  _PostCreateScreenWidgetState createState() => _PostCreateScreenWidgetState();
}

class _PostCreateScreenWidgetState extends State<PostCreateScreenWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      setState(() => FFAppState().temporaryImages = []);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        iconTheme:
            IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
        automaticallyImplyLeading: true,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
              child: AuthUserStreamWidget(
                child: Container(
                  width: 48,
                  height: 48,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: valueOrDefault<String>(
                      currentUserPhoto,
                      'ChRDaXJjbGVJbWFnZV8zdWJxcHRodxgMIv4BMjMKImh0dHBzOi8vcGljc3VtLnBob3Rvcy9zZWVkLzkxNy82MDAQASILCgkJAAAAAAAATkCaAcIBCAYIASq7AQgCGg8KCwoJUGhvdG8gVVJMEAQypQEIBBKgAWh0dHBzOi8vZmlyZWJhc2VzdG9yYWdlLmdvb2dsZWFwaXMuY29tL3YwL2IvZmx1dHRlci1mbG93LWtvcmVhLmFwcHNwb3QuY29tL28vYXBwLWFzc2V0cyUyRm5ldy1hbm9ueW1vdXMucG5nP2FsdD1tZWRpYSZ0b2tlbj1hNTQ4ZmY2Ni0wMjZkLTRhMTYtYjBkZC01MTg3YjhjN2NhMDT6AwBiAJIBBzCvl+/7mDA=',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(
              widget.category,
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 22,
                  ),
            ),
            Text(
              '  글쓰기',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 22,
                  ),
            ),
          ],
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
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
                    if (!(loggedIn) ?? true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: SignInButtonComponentWidget(),
                      ),
                    if (loggedIn ?? true)
                      PostCreateComponentWidget(
                        category: valueOrDefault<String>(
                          widget.category,
                          '자유게시판',
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import '../auth/firebase_user_provider.dart';
import '../components/post_create_component_widget.dart';
import '../components/sign_in_button_component_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostCreateScreenWidget extends StatefulWidget {
  const PostCreateScreenWidget({Key key}) : super(key: key);

  @override
  _PostCreateScreenWidgetState createState() => _PostCreateScreenWidgetState();
}

class _PostCreateScreenWidgetState extends State<PostCreateScreenWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          '글 쓰기',
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0x00EEEEEE),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (!(loggedIn) ?? true)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: SignInButtonComponentWidget(),
                    ),
                  if (loggedIn ?? true) PostCreateComponentWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

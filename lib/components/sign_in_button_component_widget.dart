import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../sign_in_screen/sign_in_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInButtonComponentWidget extends StatefulWidget {
  const SignInButtonComponentWidget({Key key}) : super(key: key);

  @override
  _SignInButtonComponentWidgetState createState() =>
      _SignInButtonComponentWidgetState();
}

class _SignInButtonComponentWidgetState
    extends State<SignInButtonComponentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignInScreenWidget(),
              ),
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.login,
                color: Colors.black,
                size: 24,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '앗, 글을 쓰기 위해 로그인을 먼저 해 주세요.',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Text(
                      '로그인 하기',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

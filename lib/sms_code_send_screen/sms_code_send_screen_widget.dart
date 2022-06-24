import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../sms_code_screen/sms_code_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class SmsCodeSendScreenWidget extends StatefulWidget {
  const SmsCodeSendScreenWidget({
    Key key,
    this.phoneNumber,
  }) : super(key: key);

  final String phoneNumber;

  @override
  _SmsCodeSendScreenWidgetState createState() =>
      _SmsCodeSendScreenWidgetState();
}

class _SmsCodeSendScreenWidgetState extends State<SmsCodeSendScreenWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      final phoneNumberVal = widget.phoneNumber;
      if (phoneNumberVal == null ||
          phoneNumberVal.isEmpty ||
          !phoneNumberVal.startsWith('+')) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Phone Number is required and has to start with +.'),
          ),
        );
        return;
      }
      await beginPhoneAuth(
        context: context,
        phoneNumber: phoneNumberVal,
        onCodeSent: () async {
          await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => SmsCodeScreenWidget(),
            ),
            (r) => false,
          );
        },
      );
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
        title: Text(
          '인증코드를 전송 중 ...',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(64, 64, 64, 64),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '아래의 전화 번호로 인증코드를 전송합니다.',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Text(
                        widget.phoneNumber,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                      child: Image.asset(
                        'assets/images/Loading_icon.gif',
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
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

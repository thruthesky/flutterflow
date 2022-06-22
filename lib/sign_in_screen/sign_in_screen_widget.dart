import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../sms_code_send_screen/sms_code_send_screen_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreenWidget extends StatefulWidget {
  const SignInScreenWidget({Key key}) : super(key: key);

  @override
  _SignInScreenWidgetState createState() => _SignInScreenWidgetState();
}

class _SignInScreenWidgetState extends State<SignInScreenWidget> {
  TextEditingController phoneNumberTextFieldController;
  TextEditingController textController1;
  bool agreementSwitchListTileValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    phoneNumberTextFieldController = TextEditingController();
    textController1 = TextEditingController(
        text:
            '제 1 장 총 칙\n\n제 1 조 (목적)\n이 약관은 한국 플러터 개발자 그룹(이하 \"앱\"라 합니다)에서 제공하는 웹 및 모바일 애플리케이션 서비스(이하 \"서비스\"라 합니다)의 이용 조건 및 절차에 관한 기본적인 사항을 규정함을 목적으로 합니다.\n\n제 2 조 (약관의 효력 및 변경)\n① 이 약관은 서비스 화면이나 기타의 방법으로 이용고객에게 공지함으로써 효력을 발생합니다.\n② 사이트는 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.\n\n제 3 조 (용어의 정의)\n이 약관에서 사용하는 용어의 정의는 다음과 같습니다.\n① 회원 : 앱 서비스 이용을 위해 가입(또는 로그인)하는 개인 또는 단체를 말합니다.\n② 신청자 : 회원가입(또는 로그인)을 신청하는 개인 또는 단체를 말합니다.\n③ 해지 : 회원이 서비스 이용계약을 취소하는 것을 말합니다.\n\n제 2 장 서비스 이용계약\n\n제 4 조 (이용계약의 성립)\n① 이용약관 하단의 동의 버튼을 누르면 이 약관에 동의하는 것으로 간주됩니다.\n② 이용계약은 서비스 이용희망자의 이용약관 동의 후 이용 신청에 대하여 앱이 승낙함으로써 성립합니다.\n\n제 5 조 (이용신청)\n① 신청자가 본 서비스를 이용하기 위해서는 앱에서 요청하는 소정의 양식에서 이용자 정보를 기록하여 제출해야 합니다.\n② 가입신청(또는 회원 정보) 양식에 기재하는 모든 이용자 정보는 모두 실제 데이터인 것으로 간주됩니다. 실명이나 실제 정보를 입력하지 않은 사용자는 법적인 보호를 받을 수 없으며, 서비스의 제한을 받을 수 있습니다.\n\n제 6 조 (이용신청의 승낙)\n① 앱은 신청자에 대하여 제2항, 제3항의 경우를 예외로 하여 서비스 이용신청을 승낙합니다.\n② 앱은 다음에 해당하는 경우에 그 신청에 대한 승낙 제한사유가 해소될 때까지 승낙을 유보할 수 있습니다.\n가. 서비스 관련 설비에 여유가 없는 경우\n나. 기술상 지장이 있는 경우\n다. 기타 앱이 필요하다고 인정되는 경우\n③ 앱 신청자가 다음에 해당하는 경우에는 승낙을 거부할 수 있습니다.\n가. 다른 개인의 명의를 사용하여 신청한 경우\n나. 이용자 정보를 허위로 기재하여 신청한 경우\n다. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우\n라. 기타 사이트 소정의 이용신청요건을 충족하지 못하는 경우\n\n제 7 조 (이용자정보의 변경)\n회원은 이용 신청시에 기재했던 회원정보가 변경되었을 경우에는, 온라인으로 수정하여야 하며 변경하지 않음으로 인하여 발생되는 모든 문제의 책임은 회원에게 있습니다.\n\n제 3 장 계약 당사자의 의무\n\n제 8 조 (앱의 의무)\n① 앱 회원에게 각 호의 서비스를 제공합니다.\n가. 신규 서비스 정보에 대한 뉴스레터 발송\n나. 추가 서비스 등록시 개인정보 자동 입력\n다. 새로운 서비스 등록, 관리를 위한 각종 부가서비스\n② 사이트는 서비스 제공과 관련하여 취득한 회원의 개인정보를 회원의 동의없이 타인에게 누설, 공개 또는 배포할 수 없으며, 서비스관련 업무 이외의 상업적 목적으로 사용할 수 없습니다. 단, 다음 각 호의 1에 해당하는 경우는 예외입니다.\n가. 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우\n나. 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우\n다. 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우\n③ 사이트는 이 약관에서 정한 바에 따라 지속적, 안정적으로 서비스를 제공할 의무가 있습니다.\n\n제 9 조 (회원의 의무)\n① 회원은 서비스 이용 시 다음 각 호의 행위를 하지 않아야 합니다.\n가. 타인의 정보를 부정하게 사용하는 행위\n나. 서비스에서 얻은 정보를 사이트의 사전승낙 없이 회원의 이용 이외의 목적으로 복제하거나 이를 변경, 출판 및 방송 등에 사용하거나 타인에게 제공하는 행위\n다. 사이트의 저작권, 타인의 저작권 등 기타 권리를 침해하는 행위\n라. 공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형 등을 타인에게 유포하는 행위\n마. 범죄와 결부된다고 객관적으로 판단되는 행위\n바. 기타 관계법령에 위배되는 행위\n② 회원은 관계법령, 이 약관에서 규정하는 사항, 서비스 이용 안내 및 주의 사항을 준수하여야 합니다.\n③ 회원은 내용별로 사이트가 서비스 공지사항에 게시하거나 별도로 공지한 이용 제한 사항을 준수하여야 합니다.\n\n제 4 장 서비스 제공 및 이용\n\n제 10 조 (회원 개인 정보 관리에 대한 회원의 의무)\n① 로그인 정보에 대한 모든 관리는 회원에게 책임이 있습니다. 회원에게 부여된 계정의 관리 소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 전적인 책임은 회원에게 있습니다.\n② 자신의 계정이 부정하게 사용된 경우 또는 기타 보안 위반에 대하여, 회원은 반드시 앱에 그 사실을 통보해야 합니다.\n\n제 11 조 (서비스 제한 및 정지)\n① 앱은 전시, 사변, 천재지변 또는 이에 준하는 국가비상사태가 발생하거나 발생할 우려가 있는 경우와 전기통신사업법에 의한 기간통신 사업자가 전기통신서비스를 중지하는 등 기타 불가항력적 사유가 있는 경우에는 서비스의 전부 또는 일부를 제한하거나 정지할 수 있습니다.\n② 앱은 제1항의 규정에 의하여 서비스의 이용을 제한하거나 정지할 때에는 그 사유 및 제한기간 등을 지체없이 회원에게 알려야 합니다.\n\n제5장 계약사항의 변경, 해지\n\n제 12 조 (정보의 변경)\n회원이 주소 등 고객정보를 변경하고자 하는 경우에는 홈페이지의 회원정보 변경 서비스를 이용하여 변경할 수 있습니다.\n\n제 13 조 (계약사항의 해지)\n회원은 서비스 이용계약을 해지할 수 있으며, 해지할 경우에는 본인이 직접 앱 서비스를 통해 해지신청을 하여야 합니다. 앱은 해지 신청이 접수된 당일부터 해당 회원의 서비스 이용을 제한합니다. 앱은 회원이 다음 각 항의 1에 해당하여 이용 계약을 해지하고자 할 경우에는 해지조치 7일전까지 그 뜻을 이용고객에게 통지하여 소명할 기회를 주어야 합니다.\n① 이용고객이 이용제한 규정을 위반하거나 그 이용제한 기간 내에 제한 사유를 해소하지 않는 경우\n② 정보통신윤리위원회가 이용해지를 요구한 경우\n③ 이용고객이 정당한 사유 없이 의견진술에 응하지 아니한 경우\n④ 타인 명의로 신청을 하였거나 신청서 내용의 허위 기재 또는 허위서류를 첨부하여 이용계약을 체결한 경우\n앱은 상기 규정에 의하여 해지된 이용고객에 대해서는 별도로 정한 기간동안 가입을 제한할 수 있습니다.\n\n제6장 손해배상\n\n제 14 조 (면책조항)\n① 앱은 회원이 서비스 제공으로부터 기대되는 이익을 얻지 못하였거나 서비스 자료에 대한 취사선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.\n② 앱은 회원의 귀책사유나 제3자의 고의로 인하여 서비스에 장애가 발생하거나 회원의 데이터가 훼손된 경우에 책임이 면제됩니다.\n③ 앱은 회원이 게시 또는 전송한 자료의 내용에 대해서는 책임이 면제됩니다.\n④ 상표권이 있는 도메인의 경우, 이로 인해 발생할 수도 있는 손해나 배상에 대한 책임은 구매한 회원 당사자에게 있으며, 앱은 이에 대한 일체의 책임을 지지 않습니다.\n\n제 15 조 (관할법원)\n\n서비스와 관련하여 앱과 회원간에 분쟁이 발생할 경우 사이트의 본사 소재지를 관할하는 법원을 관할법원으로 합니다.\n\n[부칙]\n\n(시행일) 이 약관은 2020년 6월 21부터 시행합니다.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          '전화번호 로그인',
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
                shape: BoxShape.rectangle,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextFormField(
                      controller: textController1,
                      readOnly: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: '회원 가입 약관',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFDFDFDF),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFDFDFDF),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        filled: true,
                        fillColor: Color(0xFFECECEC),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                          ),
                      maxLines: 9,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: SwitchListTile(
                        value: agreementSwitchListTileValue ??= false,
                        onChanged: (newValue) => setState(
                            () => agreementSwitchListTileValue = newValue),
                        title: Text(
                          '약관에 동의하십니까?',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        tileColor: Color(0xFFF5F5F5),
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                      child: TextFormField(
                        controller: phoneNumberTextFieldController,
                        onChanged: (_) => EasyDebounce.debounce(
                          'phoneNumberTextFieldController',
                          Duration(milliseconds: 2000),
                          () => setState(() {}),
                        ),
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: '전화번를 입력해 주세요.',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF515151),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF515151),
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
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Text(
                        '전화번호를 010 1234 5678 와 같이 입력해주세요.',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (agreementSwitchListTileValue) {
                            if (functions.isCorrectPhoneNumber(
                                phoneNumberTextFieldController.text)) {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SmsCodeSendScreenWidget(
                                    phoneNumber: functions.completePhoneNumber(
                                        phoneNumberTextFieldController.text),
                                  ),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '전화번호가 올바르지 않습니다. 다시 입력해주세요.',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).alternate,
                                ),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '약관에 동의 해 주세요.',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                duration: Duration(milliseconds: 6000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            );
                          }
                        },
                        text: '인증 코드 전송',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
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

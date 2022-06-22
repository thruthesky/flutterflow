import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../post_create_screen/post_create_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostCreateButtonWidget extends StatefulWidget {
  const PostCreateButtonWidget({Key key}) : super(key: key);

  @override
  _PostCreateButtonWidgetState createState() => _PostCreateButtonWidgetState();
}

class _PostCreateButtonWidgetState extends State<PostCreateButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return FlutterFlowIconButton(
      borderColor: Colors.transparent,
      borderRadius: 30,
      borderWidth: 1,
      buttonSize: 60,
      icon: Icon(
        Icons.create_sharp,
        color: Colors.white,
        size: 30,
      ),
      onPressed: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostCreateScreenWidget(),
          ),
        );
      },
    );
  }
}

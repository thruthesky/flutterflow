import '../components/end_drawer_column_widget.dart';
import '../components/main_screen_component_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EntryScreenWidget extends StatefulWidget {
  const EntryScreenWidget({Key key}) : super(key: key);

  @override
  _EntryScreenWidgetState createState() => _EntryScreenWidgetState();
}

class _EntryScreenWidgetState extends State<EntryScreenWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      endDrawer: Drawer(
        elevation: 16,
        child: EndDrawerColumnWidget(),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: MainScreenComponentWidget(),
        ),
      ),
    );
  }
}

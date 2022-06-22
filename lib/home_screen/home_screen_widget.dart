import '../auth/auth_util.dart';
import '../components/end_drawer_column_widget.dart';
import '../components/post_create_button_widget.dart';
import '../components/post_list_all_category_component_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../profile_screen/profile_screen_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({Key key}) : super(key: key);

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          '플러터 플로 코리아',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [
          PostCreateButtonWidget(),
          AuthUserStreamWidget(
            child: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreenWidget(),
                  ),
                );
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFFD1D1D1),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      valueOrDefault<String>(
                        currentUserPhoto,
                        'ChRDaXJjbGVJbWFnZV9zd3NqczA3NRgMIusBMkAKImh0dHBzOi8vcGljc3VtLnBob3Rvcy9zZWVkLzk4MS82MDAQASIWCgkJAAAAAAAAREASCQkAAAAAAABeQDABmgGiAQgGCAEqmwEIAhoPCgsKCVBob3RvIFVSTBAEMoUBCAQSgAFDaFJEYVhKamJHVkpiV0ZuWlY5a2FHNWllVFp5WlJnTUlqZ3lNd29pYUhSMGNITTZMeTl3YVdOemRXMHVjR2h2ZEc5ekwzTmxaV1F2TkRnNUx6WXdNQkFCSWdzS0NRa0FBQUFBQUFCRVFQb0RBR0lBa2dFSE1QdmZ5dUNYTUE9PfoDAGIAkgEHMKjC1OCXMA==',
                      ),
                    ),
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.menu,
              color: FlutterFlowTheme.of(context).primaryBtnText,
              size: 30,
            ),
            onPressed: () async {
              scaffoldKey.currentState.openEndDrawer();
            },
          ),
        ],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      endDrawer: Drawer(
        elevation: 16,
        child: EndDrawerColumnWidget(),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: PostListAllCategoryComponentWidget(),
        ),
      ),
    );
  }
}

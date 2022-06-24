import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarUserPhotoComponentWidget extends StatefulWidget {
  const AppBarUserPhotoComponentWidget({
    Key key,
    this.user,
  }) : super(key: key);

  final DocumentReference user;

  @override
  _AppBarUserPhotoComponentWidgetState createState() =>
      _AppBarUserPhotoComponentWidgetState();
}

class _AppBarUserPhotoComponentWidgetState
    extends State<AppBarUserPhotoComponentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: Color(0x00FFFFFF),
        ),
      ),
      child: AuthUserStreamWidget(
        child: FutureBuilder<UsersRecord>(
          future: UsersRecord.getDocumentOnce(widget.user),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
                ),
              );
            }
            final circleImageUsersRecord = snapshot.data;
            return Container(
              width: 42,
              height: 42,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                valueOrDefault<String>(
                  currentUserPhoto,
                  'https://firebasestorage.googleapis.com/v0/b/flutter-flow-korea.appspot.com/o/app-assets%2Fnew-anonymous.png?alt=media&token=a548ff66-026d-4a16-b0dd-5187b8c7ca04',
                ),
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}

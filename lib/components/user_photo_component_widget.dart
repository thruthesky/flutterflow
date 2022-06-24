import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserPhotoComponentWidget extends StatefulWidget {
  const UserPhotoComponentWidget({
    Key key,
    this.user,
  }) : super(key: key);

  final DocumentReference user;

  @override
  _UserPhotoComponentWidgetState createState() =>
      _UserPhotoComponentWidgetState();
}

class _UserPhotoComponentWidgetState extends State<UserPhotoComponentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: Color(0x00FFFFFF),
        ),
      ),
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
            width: 48,
            height: 48,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: CachedNetworkImage(
              imageUrl: valueOrDefault<String>(
                circleImageUsersRecord.photoUrl,
                'https://firebasestorage.googleapis.com/v0/b/flutter-flow-korea.appspot.com/o/app-assets%2Fpro-3-Untitled-1.png?alt=media&token=c201475d-1f06-4674-a91b-f80ddaf7358e',
              ),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}

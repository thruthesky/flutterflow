import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadFormComponentWidget extends StatefulWidget {
  const UploadFormComponentWidget({Key key}) : super(key: key);

  @override
  _UploadFormComponentWidgetState createState() =>
      _UploadFormComponentWidgetState();
}

class _UploadFormComponentWidgetState extends State<UploadFormComponentWidget> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible:
          functions.hasTemporaryImages(FFAppState().temporaryImages.toList()) ??
              true,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
          ),
          child: Builder(
            builder: (context) {
              final uploadedImages =
                  FFAppState().temporaryImages?.toList() ?? [];
              return GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: uploadedImages.length,
                itemBuilder: (context, uploadedImagesIndex) {
                  final uploadedImagesItem =
                      uploadedImages[uploadedImagesIndex];
                  return Stack(
                    children: [
                      Image.network(
                        uploadedImagesItem,
                        width: MediaQuery.of(context).size.width * 0.333,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        icon: Icon(
                          Icons.delete_forever,
                          color: FlutterFlowTheme.of(context).alternate,
                          size: 30,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

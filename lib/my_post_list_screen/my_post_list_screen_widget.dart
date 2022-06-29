import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../post_view_screen/post_view_screen_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MyPostListScreenWidget extends StatefulWidget {
  const MyPostListScreenWidget({Key key}) : super(key: key);

  @override
  _MyPostListScreenWidgetState createState() => _MyPostListScreenWidgetState();
}

class _MyPostListScreenWidgetState extends State<MyPostListScreenWidget> {
  PagingController<DocumentSnapshot, PostsRecord> _pagingController;
  Query _pagingQuery;
  List<StreamSubscription> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
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
          '나의 글 목록',
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: PagedListView<DocumentSnapshot<Object>, PostsRecord>(
            pagingController: () {
              final Query<Object> Function(Query<Object>) queryBuilder =
                  (postsRecord) => postsRecord
                      .where('userDocumentReference',
                          isEqualTo: currentUserReference)
                      .orderBy('timestamp');
              if (_pagingController != null) {
                final query = queryBuilder(PostsRecord.collection);
                if (query != _pagingQuery) {
                  // The query has changed
                  _pagingQuery = query;
                  _streamSubscriptions.forEach((s) => s?.cancel());
                  _streamSubscriptions.clear();
                  _pagingController.refresh();
                }
                return _pagingController;
              }

              _pagingController = PagingController(firstPageKey: null);
              _pagingQuery = queryBuilder(PostsRecord.collection);
              _pagingController.addPageRequestListener((nextPageMarker) {
                queryPostsRecordPage(
                  queryBuilder: (postsRecord) => postsRecord
                      .where('userDocumentReference',
                          isEqualTo: currentUserReference)
                      .orderBy('timestamp'),
                  nextPageMarker: nextPageMarker,
                  pageSize: 25,
                  isStream: true,
                ).then((page) {
                  _pagingController.appendPage(
                    page.data,
                    page.nextPageMarker,
                  );
                  final streamSubscription = page.dataStream?.listen((data) {
                    final itemIndexes = _pagingController.itemList
                        .asMap()
                        .map((k, v) => MapEntry(v.reference.id, k));
                    data.forEach((item) {
                      final index = itemIndexes[item.reference.id];
                      final items = _pagingController.itemList;
                      if (index != null) {
                        items.replaceRange(index, index + 1, [item]);
                        _pagingController.itemList = {
                          for (var item in items) item.reference: item
                        }.values.toList();
                      }
                    });
                    setState(() {});
                  });
                  _streamSubscriptions.add(streamSubscription);
                });
              });
              return _pagingController;
            }(),
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            builderDelegate: PagedChildBuilderDelegate<PostsRecord>(
              // Customize what your widget looks like when it's loading the first page.
              firstPageProgressIndicatorBuilder: (_) => Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
                ),
              ),

              itemBuilder: (context, _, listViewIndex) {
                final listViewPostsRecord =
                    _pagingController.itemList[listViewIndex];
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostViewScreenWidget(
                            postReference: listViewPostsRecord.reference,
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        listViewPostsRecord.title.maybeHandleOverflow(
                          maxChars: 20,
                          replacement: '…',
                        ),
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      subtitle: Text(
                        functions
                            .oneLineString(listViewPostsRecord.content)
                            .maybeHandleOverflow(
                              maxChars: 24,
                              replacement: '…',
                            ),
                        style: FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Colors.transparent,
                      dense: false,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

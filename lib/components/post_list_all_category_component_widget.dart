import '../backend/backend.dart';
import '../components/post_title_component_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PostListAllCategoryComponentWidget extends StatefulWidget {
  const PostListAllCategoryComponentWidget({Key key}) : super(key: key);

  @override
  _PostListAllCategoryComponentWidgetState createState() =>
      _PostListAllCategoryComponentWidgetState();
}

class _PostListAllCategoryComponentWidgetState
    extends State<PostListAllCategoryComponentWidget> {
  PagingController<DocumentSnapshot, PostsRecord> _pagingController;
  Query _pagingQuery;
  List<StreamSubscription> _streamSubscriptions = [];

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<DocumentSnapshot<Object>, PostsRecord>(
      pagingController: () {
        final Query<Object> Function(Query<Object>) queryBuilder =
            (postsRecord) => postsRecord.orderBy('timestamp', descending: true);
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
            queryBuilder: (postsRecord) =>
                postsRecord.orderBy('timestamp', descending: true),
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
                  _pagingController.itemList
                      .replaceRange(index, index + 1, [item]);
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
      primary: false,
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
          final listViewPostsRecord = _pagingController.itemList[listViewIndex];
          return Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Color(0x00FFFFFF),
            ),
            child: PostTitleComponentWidget(
              post: listViewPostsRecord,
            ),
          );
        },
      ),
    );
  }
}

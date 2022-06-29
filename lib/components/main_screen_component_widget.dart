import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/app_header_component_widget.dart';
import '../components/post_list_all_category_component_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../forum_search_screen/forum_search_screen_widget.dart';
import '../other_user_profile_screen/other_user_profile_screen_widget.dart';
import '../post_view_screen/post_view_screen_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MainScreenComponentWidget extends StatefulWidget {
  const MainScreenComponentWidget({Key key}) : super(key: key);

  @override
  _MainScreenComponentWidgetState createState() =>
      _MainScreenComponentWidgetState();
}

class _MainScreenComponentWidgetState extends State<MainScreenComponentWidget> {
  PagingController<DocumentSnapshot, PostsRecord> _pagingController;
  Query _pagingQuery;

  TextEditingController searchTextFieldController;

  @override
  void initState() {
    super.initState();
    searchTextFieldController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
            child: AppHeaderComponentWidget(
              category: '자유게시판',
              displaySearchIcon: true,
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 100,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                    child: TextFormField(
                      controller: searchTextFieldController,
                      onChanged: (_) => EasyDebounce.debounce(
                        'searchTextFieldController',
                        Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      onFieldSubmitted: (_) async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForumSearchScreenWidget(
                              word: searchTextFieldController.text,
                            ),
                          ),
                        );
                      },
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: '노 코드가 궁금하시면 검색 ^^;',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFA1A1A1),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFA1A1A1),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        prefixIcon: Icon(
                          Icons.search_sharp,
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                  child: StreamBuilder<List<PostsRecord>>(
                    stream: queryPostsRecord(
                      queryBuilder: (postsRecord) => postsRecord
                          .where('category', isEqualTo: '공지사항')
                          .orderBy('timestamp', descending: true),
                    ),
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
                      List<PostsRecord> socialCardPostsRecordList =
                          snapshot.data;
                      return InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PostViewScreenWidget(
                                postReference: functions
                                    .firstPost(
                                        socialCardPostsRecordList.toList())
                                    .reference,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 160,
                                child: Stack(
                                  alignment: AlignmentDirectional(0, 1),
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, -1),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              functions.firstImageOfFirstPost(
                                                  socialCardPostsRecordList
                                                      .toList()),
                                          width: double.infinity,
                                          height: 130,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 1),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 24, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons
                                                      .featured_play_list_rounded,
                                                  color: Color(0xFF39D2C0),
                                                  size: 20,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 0, 0),
                                                  child: Text(
                                                    '공지사항',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF39D2C0),
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 12),
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFF4B39EF),
                                                      Color(0xFF39D2C0),
                                                      Color(0xFFFF5963)
                                                    ],
                                                    stops: [0, 0.3, 1],
                                                    begin: AlignmentDirectional(
                                                        1, 0.98),
                                                    end: AlignmentDirectional(
                                                        -1, -0.98),
                                                  ),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(2, 2, 2, 2),
                                                  child: Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Icon(
                                                      Icons
                                                          .chevron_right_rounded,
                                                      color: Color(0xFF101213),
                                                      size: 32,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(16, 8, 0, 0),
                                child: Text(
                                  functions
                                      .firstPost(
                                          socialCardPostsRecordList.toList())
                                      .title,
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF101213),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 4, 16, 0),
                                child: Text(
                                  functions
                                      .firstPost(
                                          socialCardPostsRecordList.toList())
                                      .content
                                      .maybeHandleOverflow(
                                        maxChars: 110,
                                        replacement: '…',
                                      ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF57636C),
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 4, 16, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Color(0xFFAC08F6),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(45),
                                      ),
                                      child: StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            functions
                                                .firstPost(
                                                    socialCardPostsRecordList
                                                        .toList())
                                                .userDocumentReference),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          final circleImageUsersRecord =
                                              snapshot.data;
                                          return Container(
                                            width: 32,
                                            height: 32,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: CachedNetworkImage(
                                              imageUrl: circleImageUsersRecord
                                                  .photoUrl,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 0, 0),
                                      child: Text(
                                        '좋아요 (${formatNumber(
                                          functions
                                              .firstPost(
                                                  socialCardPostsRecordList
                                                      .toList())
                                              .likes
                                              .length,
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.automatic,
                                        )})',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFFFF5963),
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '자세히 보기...',
                                        textAlign: TextAlign.end,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF4B39EF),
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                    child: Text(
                      '최근 가입 사용자',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 125,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: FutureBuilder<List<UsersRecord>>(
                        future: queryUsersRecordOnce(
                          queryBuilder: (usersRecord) => usersRecord
                              .where('hasPhoto', isEqualTo: true)
                              .orderBy('created_time', descending: true),
                          limit: 100,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          List<UsersRecord> listViewUsersRecordList = snapshot
                              .data
                              .where((u) => u.uid != currentUserUid)
                              .toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: listViewUsersRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewUsersRecord =
                                  listViewUsersRecordList[listViewIndex];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 16, 4, 16),
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                OtherUserProfileScreenWidget(
                                              userDocumentReference:
                                                  listViewUsersRecord.reference,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color: Color(0xFFF5F5F5),
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(32),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl: listViewUsersRecord
                                                    .photoUrl,
                                                width: 64,
                                                height: 64,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                listViewUsersRecord.displayName,
                                                '...',
                                              ).maybeHandleOverflow(
                                                  maxChars: 8),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Text(
                      '최근 사진 모음',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: PagedListView<DocumentSnapshot<Object>, PostsRecord>(
                    pagingController: () {
                      final Query<Object> Function(Query<Object>) queryBuilder =
                          (postsRecord) => postsRecord
                              .where('hasPhoto', isEqualTo: true)
                              .orderBy('timestamp', descending: true);
                      if (_pagingController != null) {
                        final query = queryBuilder(PostsRecord.collection);
                        if (query != _pagingQuery) {
                          // The query has changed
                          _pagingQuery = query;

                          _pagingController.refresh();
                        }
                        return _pagingController;
                      }

                      _pagingController = PagingController(firstPageKey: null);
                      _pagingQuery = queryBuilder(PostsRecord.collection);
                      _pagingController
                          .addPageRequestListener((nextPageMarker) {
                        queryPostsRecordPage(
                          queryBuilder: (postsRecord) => postsRecord
                              .where('hasPhoto', isEqualTo: true)
                              .orderBy('timestamp', descending: true),
                          nextPageMarker: nextPageMarker,
                          pageSize: 25,
                          isStream: false,
                        ).then((page) {
                          _pagingController.appendPage(
                            page.data,
                            page.nextPageMarker,
                          );
                        });
                      });
                      return _pagingController;
                    }(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
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
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PostViewScreenWidget(
                                    postReference:
                                        listViewPostsRecord.reference,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 220,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: CachedNetworkImage(
                                        imageUrl: functions.firstImageOfPost(
                                            listViewPostsRecord),
                                        width: double.infinity,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Text(
                                        listViewPostsRecord.title
                                            .maybeHandleOverflow(
                                          maxChars: 20,
                                          replacement: '…',
                                        ),
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          PostListAllCategoryComponentWidget(),
        ],
      ),
    );
  }
}

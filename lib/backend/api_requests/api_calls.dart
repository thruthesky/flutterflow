import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class CharactersCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Characters',
      apiUrl: 'https://swapi.dev/api/people',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic names(dynamic response) => getJsonField(
        response,
        r'''$..name''',
      );
  static dynamic results(dynamic response) => getJsonField(
        response,
        r'''$.results''',
      );
}

class SearchApiCall {
  static Future<ApiCallResponse> call({
    String q = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'searchApi',
      apiUrl:
          'https://withcenter.philgo.com/collections/no-code-study-posts/documents/search?query_by=title,content&',
      callType: ApiCallType.GET,
      headers: {
        'X-TYPESENSE-API-KEY': '12345a',
      },
      params: {
        'q': q,
      },
      returnBody: true,
    );
  }

  static dynamic documents(dynamic response) => getJsonField(
        response,
        r'''$.hits..document''',
      );
}

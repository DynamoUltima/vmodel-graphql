import 'package:graphql_flutter/graphql_flutter.dart';
import '../graphql_string.dart' as gql_string;

Future deleteBlog(
  String blogId,
) async {
  HttpLink link =
      HttpLink("https://vmodel-app.herokuapp.com/graphql/"); // same link
  GraphQLClient qlClient = GraphQLClient(
    link: link,
    cache: GraphQLCache(
        // store: HiveStore(),
        ),
  );
  QueryResult queryResult = await qlClient.query(
    QueryOptions(
        fetchPolicy: FetchPolicy
            .networkOnly, // this is not required , use only in get i.e when you are fetching data
        document: gql(
          gql_string.deleteBlogMutation,
        ),
        variables: {
          'blogId': blogId,
        }),
  );

  print(queryResult.data);

  return queryResult.data?['deleteBlog'] ??
      ""; // same as other getting true or false in response
}

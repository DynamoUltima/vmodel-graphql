import 'package:graphql_flutter/graphql_flutter.dart';
import '../graphql_string.dart' as gql_string;

Future updateBlog(
    String blogId, String title, String subTitle, String body) async {
  HttpLink link =
      HttpLink("https://vmodel-app.herokuapp.com/graphql/"); // same link
  GraphQLClient qlClient = GraphQLClient(
    link: link,
    cache: GraphQLCache(
        // store: HiveStore(),
        ),
  );
  QueryResult queryResult = await qlClient.mutate(
    // mutate method , as we are mutating value
    MutationOptions(
        // mutation options
        fetchPolicy: FetchPolicy.networkOnly,
        document: gql(
          gql_string.updateBlogMutation,
        ),
        variables: {
          'blogId': blogId, // it takes int so converting
          'title': title,
          'subTitle': subTitle,
          'body': body,
        }),
  );
  print(queryResult.data?['updateBlog']);

  return queryResult.data?['updateBlog'] ??
      ""; // here i get response in updateUserInfo as true or false
}

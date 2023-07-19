import 'package:graphql_flutter/graphql_flutter.dart';
import '../graphql_string.dart' as gql_string;


Future createBlog(String title, String subTitle, String body) async {
  HttpLink link = HttpLink("https://vmodel-app.herokuapp.com/graphql/"); 
  GraphQLClient qlClient = GraphQLClient(
    link: link,
    cache: GraphQLCache(
      // store: HiveStore(),
    ),
  );
  QueryResult queryResult = await qlClient.mutate(
    MutationOptions(
        // we use mutation options
        fetchPolicy: FetchPolicy.networkOnly, //
        document: gql(
          gql_string.createblogMutation, //
        ),
        variables: {
          'title': title,
          'subTitle': subTitle,
          'body': body,
        }),
  );
  print("create blog");

  // print(queryResult.data?['createBlog']);

  return queryResult.data?['createBlog'] ?? "";
}

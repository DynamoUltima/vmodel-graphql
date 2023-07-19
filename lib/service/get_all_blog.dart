import 'package:graphql_flutter/graphql_flutter.dart';
import '../graphql_string.dart' as gql_string;

Future<List> getAllBlogPost() async {
  print('called');
  HttpLink link = HttpLink(
      "https://vmodel-app.herokuapp.com/graphql/"); 
  GraphQLClient qlClient = GraphQLClient(
   
    link: link,
    cache: GraphQLCache(
      // store: HiveStore(),
    ),
  );
  QueryResult queryResult = await qlClient.query(

    QueryOptions(
      fetchPolicy: FetchPolicy.networkOnly,
      document: gql(
        gql_string.getAllBlogsQuery, 
      ),
    ),
  );

  var data = queryResult.data?['allBlogPosts'];
  // print({data: data, "results": "ok"});
  print(data);

  return queryResult.data?['allBlogPosts'] ??
      []; // here i am getting list in getUsers field which i am return
}

import 'package:graphql_flutter/graphql_flutter.dart';
import '../graphql_string.dart' as gql_string;

Future<Map<String, dynamic>> getBlogPost(String id) async {


  HttpLink link = HttpLink("https://vmodel-app.herokuapp.com/graphql/");
  GraphQLClient qlClient = GraphQLClient(
    link: link,
    cache: GraphQLCache(
        // store: HiveStore(),
        ), // cache
  );
  QueryResult queryResult = await qlClient.query(
   
    QueryOptions(
       
        fetchPolicy: FetchPolicy.networkOnly,
        document: gql(
          gql_string.getblogPost, 
        ),
        variables: {
          "blogId": id, 
        }),
  );

  print(queryResult.data);

  return queryResult.data?['blogPost'] ??
      {}; 
}

import 'package:flutter/material.dart';
import 'package:v_model_test_app/components/cards/blogCard.dart';

import '../components/cards/blog_card.dart';
import '../service/get_all_blog.dart';
import 'add_blog_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List>(
          future: getAllBlogPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("snap data");
              print(snapshot.data);
            }

            if (!snapshot.hasData) {
              print(' no data');
            }

            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return GigCardWidget(
                  title: snapshot.data?[index]['title'] ?? "",
                  subTitle: snapshot.data?[index]['subTitle'] ?? "",
                  body: snapshot.data?[index]['body'] ?? "",
                  id: snapshot.data?[index]['id'] ?? "",
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddBlogPage(),
          ));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
    );
  }
}
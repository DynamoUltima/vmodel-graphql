// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:v_model_test_app/constants/constanst.dart';
import 'package:v_model_test_app/service/get_blog_post.dart';
import 'package:v_model_test_app/views/update_blog.dart';

import '../service/delete_blog.dart';
import 'home.dart';

class BlogDetailPage extends StatefulWidget {
  final String id;
  const BlogDetailPage({super.key, required this.id});

  @override
  State<BlogDetailPage> createState() => _BlogDetailPageState();
}

class _BlogDetailPageState extends State<BlogDetailPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getBlogPost(widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print('detailed data');
              print(snapshot.data);
            }

            if (!snapshot.hasData) {
              print('no data');
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            return ListView(
              
              
              children: [
                Image.asset(imageAsset),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0),
                  child: Text(snapshot.data?['title'] ?? ""),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0),
                  child: Text(snapshot.data?['subTitle'] ?? ""),
                ),
                Padding(
                 padding: const EdgeInsets.symmetric(horizontal:10.0),
                  child: Text(snapshot.data?['body'] ?? ""),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0),
                  child: Text(snapshot.data?['dateCreated'] ?? ""),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white),
                      onPressed: () {

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UpdateBlogPage(id: widget.id,
                             body: snapshot.data?['body'] ?? "",
                              subTitle: snapshot.data?['subTitle']??"", 
                              title: snapshot.data?['title'] ?? "",)));
                       
                      },
                      child: Text('Update'),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          foregroundColor: Colors.white),
                      onPressed: () async {
                        var results = await deleteBlog(widget.id);
                        print('delete called');
                        print(results);

                        if (results['success']) {
                          print('deleted');
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage()));
                        }
                      },
                      child: Text('Delete'),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../service/create_blog.dart';
import '../service/update_blog.dart';
import 'home.dart';

class UpdateBlogPage extends StatefulWidget {
  final String id;
  final String title;
  final String subTitle;
  final String body;

  const UpdateBlogPage(
      {super.key,
      required this.id,
      required this.subTitle,
      required this.body,
      required this.title});

  @override
  State<UpdateBlogPage> createState() => _UpdateBlogPageState();
}

class _UpdateBlogPageState extends State<UpdateBlogPage> {
  TextEditingController titleEditController = TextEditingController();
  TextEditingController subTitleEditController = TextEditingController();
  TextEditingController bodyEditController = TextEditingController();
  String textTitle = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Update a blog", style: TextStyle(fontSize: 24)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    // initialValue: widget.title,
                    controller: titleEditController,
                    validator: (val) {
                      if (val!.isEmpty) return "Cannot be empty";
                      return null;
                    },
                    onChanged: (val) {},
                    decoration: InputDecoration(
                      hintText: 'Write blog Title',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    // initialValue: widget.subTitle,
                    controller: subTitleEditController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Cannot be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Write blog subTitle',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLines: 2,
                    // initialValue: widget.body,
                    controller: bodyEditController,
                    onChanged: (val) {},
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Cannot be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Write blog description',
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white),
                      onPressed: () async {
                        var results = await updateBlog(
                            widget.id,
                            titleEditController.text,
                            subTitleEditController.text,
                            bodyEditController.text);

                        print(results);
                        if (results['success']) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage()));
                        }
                      },
                      child: Text('Update Blog'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

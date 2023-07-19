// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../service/create_blog.dart';
import 'home.dart';

class AddBlogPage extends StatefulWidget {
  const AddBlogPage({super.key});

  @override
  State<AddBlogPage> createState() => _AddBlogPageState();
}

class _AddBlogPageState extends State<AddBlogPage> {
  TextEditingController titleEditController = TextEditingController();
  TextEditingController subTitleEditController = TextEditingController();
  TextEditingController bodyEditController = TextEditingController();
  String textTitle = "";
  var _formKey = GlobalKey<FormState>();

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
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Add a blog", style: TextStyle(fontSize: 24)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: titleEditController,
                    onChanged: (val) {},
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Cannot be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Write blog Title',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: subTitleEditController,
                    onChanged: (val) {},
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
                        if (_formKey.currentState!.validate()) {
                          var results = await createBlog(
                              titleEditController.text,
                              subTitleEditController.text,
                              bodyEditController.text);

                          print(results);
                          if (results['success']) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomePage()));
                          }
                        }
                      },
                      child: Text('Add Blog'),
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

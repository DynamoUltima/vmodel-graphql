import 'package:flutter/material.dart';
import 'package:v_model_test_app/constants/constanst.dart';

import '../../views/detail_blog_page.dart';

class GigCardWidget extends StatefulWidget {
  final String title;
  final String subTitle;
  final String body;
  final String id;

  // final Widget pageObject;
  const GigCardWidget(
      {super.key,
      required String this.title,
      required String this.subTitle,
      required String this.body,
      required String this.id});

  @override
  State<GigCardWidget> createState() => _GigCardWidgetState();
}

class _GigCardWidgetState extends State<GigCardWidget> {
  String gigImages = "";
  bool isloading = false;
  bool buttonActive = false;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    String imageAsset = "assets/images/male.jpg";

    double rightCardSectionPadding = screenWidth < 400 ? 2 : 4;

    return Card(
      color: Colors.white,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 2,
      child: Container(
        height: 215,
        width: 210,
        child: Row(
          children: [
            Expanded(
              flex: 8,
              child: Container(
                  // color: Colors.blue,
                  padding: EdgeInsets.only(left: 5),
                  height: 200,
                  width: 250,
                  child: Image.asset(imageAsset)
                 
                  ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 8, vertical: rightCardSectionPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                      // visualDensity:VisualDensity.compact ,
                      // minLeadingWidth: 30,
                      horizontalTitleGap: 0,
                      // minVerticalPadding: 1,

                      dense: true,
                      isThreeLine: false,
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          imgSrc,
                        ),
                        // : AssetImage('assets/images/profile.png')
                        //     as ImageProvider,
                      ),
                      // Text("P",style: TextStyle(color: Colors.white),),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Wrap(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                              children: [
                                Text(
                                  widget.title,
                                  maxLines: 1,
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      // trailing: trailingWidget(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: [
                          Container(
                            width: 140,
                            child: Wrap(
                              clipBehavior: Clip.hardEdge,
                              children: [
                                Text(widget.subTitle,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,

                                    // ignore: prefer_const_constructors
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    screenWidth < 300
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(
                                top: 1.0, right: 8, left: 15),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    widget.subTitle,
                                    maxLines: screenWidth < 300 ? 1 : 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .apply(
                                            bodyColor: Colors.grey[700],
                                            fontSizeFactor: 0.85)
                                        .button,
                                    textScaleFactor: 0.75,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    // Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 0.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            // flex: 6,
                            child: Container(),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.all(8),
                                    backgroundColor: Colors.green,
                                    primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      // side: BorderSide(
                                      //     color: Colors.red),
                                    ),
                                  ),
                                  child: Text('Details'),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          BlogDetailPage(id: widget.id),
                                    ));
                                  },
                                )

                                
                                ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

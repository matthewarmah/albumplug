import 'package:flutter/material.dart';

import '../../models/posts.dart';
import '../../services/database.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
          title: Text('Album Plug',
              style: TextStyle(
                color: Colors.black,
                fontSize: 33,
                fontWeight: FontWeight.bold,
                fontFamily: 'Oswald',
              )),
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.menu,
              color: Colors.green[200],
            ),
          ),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.search,
                    color: Colors.green[200],
                    size: 26.0,
                  ),
                )),
          ],
        ),
        body: SafeArea(
          child: Container(
            height: 800,
            width: 500,
            child: FutureBuilder(
                future: Database().getPost(),
                builder: (context, AsyncSnapshot snapshot) {
                  List<Post> posts = snapshot.data;
                  return ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: ((context, index) {
                        Post post = posts[index];
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: GestureDetector(
                                //onDoubleTap: Navigator.push(context, route),
                                child: Container(
                                  height: 300,
                                  width: 300,
                                  child:
                                      Image(image: NetworkImage(post.imageUrl)),
                                ),
                              ),
                            ),
                            Text(post.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                post.text,
                              ),
                            ),
                          ],
                        );
                      }));
                }),
          ),
        ),
      ),
    );
  }
}

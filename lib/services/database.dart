import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';
import '../models/posts.dart';
import '../sceens/auth/auth.dart';
import 'package:uuid/uuid.dart';

class Database {
  final connection = FirebaseDatabase.instance.ref();
  Future<void> savePost({title, text, imageUrl}) async {
    String user = await Authentication().currentUser();
    String postId = Uuid().v1();
    DatabaseReference globalPostRef = connection.child('posts').child(postId);
    globalPostRef.set({
      'title': title,
      'text': text,
      'imageUrl': imageUrl,
    });
    print('SAVINGGGPOST');
    print(user);
    DatabaseReference postReference =
        connection.child('users').child(user).child('posts').child(postId);
    postReference.set({
      'title': title,
      'text': text,
      'imageUrl': imageUrl,
    });
    print('SAVING POST');
    print(user);
  }

  Future<List<Post>> getPost() async {
    DatabaseReference productRef = connection.child('posts');
    final event = await productRef.once(DatabaseEventType.value);
    final data = event.snapshot.value as Map;
    final List<Post> stories = [];
    data.forEach((key, value) {
      stories.add(Post.fromJSON(value));
    });
    return stories;
  }

  Future<void> saveStory({imageUrl, title, required text}) async {
    String? userId = Authentication().currentuser?.uid;
    String storyId = Uuid().v1();
    DatabaseReference productRef =
        await connection.child('posts').child(storyId);
    await productRef.set(
      {
        'userUid': userId,
        'storyUid': storyId,
        'title': title,
        'text': text,
        'imageUrl': imageUrl,
      },
    );
  }
}

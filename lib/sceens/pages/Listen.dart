import 'package:flutter/material.dart';

class UserListen extends StatefulWidget {
  UserListen({Key? key}) : super(key: key);

  @override
  State<UserListen> createState() => _UserListenState();
}

class _UserListenState extends State<UserListen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              height: 450,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

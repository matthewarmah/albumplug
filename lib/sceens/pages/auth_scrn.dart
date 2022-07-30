import 'package:albumplug3/sceens/pages/login_page.dart';
import 'package:albumplug3/services/auth2.dart';
import 'package:flutter/material.dart';

class AuthScrn extends StatefulWidget {

AuthScrn({Key? key}) : super(key: key);
@override
State<AuthScrn> createState() => _AuthScrnState();
}
class _AuthScrnState extends State<AuthScrn> {
bool isLogin = true;
toggle() {
setState(() => isLogin = !isLogin);
}
@override
Widget build(BuildContext context) {
if (isLogin) {
return LoginPage(onClickedSignUp: toggle);
} else {
return RegisterScrn(onClickedLogin: toggle);
}
}
}
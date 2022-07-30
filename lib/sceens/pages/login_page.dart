import 'package:albumplug3/sceens/auth/auth.dart';
import 'package:albumplug3/sceens/pages/home_page.dart';
import 'package:albumplug3/sceens/pages/signup.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final onClickedSignUp;
  LoginPage({required this.onClickedSignUp});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String inputEmail = '';
  String inputPassword = '';
  String errorMessage = '';
  final Authentication _auth = Authentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Login',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      inputEmail = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please enter in your email';
                    }
                  },
                  decoration: const InputDecoration(
                      hintText: 'Enter your email', icon: Icon(Icons.email)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      inputPassword = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please enter in your password';
                    }
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: 'Enter your password',
                      icon: Icon(Icons.password)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final String? result =
                            await _auth.loginUser(
                                inputEmail, inputPassword);
                        if (result != null) {
                          setState(() {
                            errorMessage = result;
                          });
                        }
                      }
                    },
                    child: Text('Login')),
              ),
              TextButton(
                  onPressed: () {
                    widget.onClickedSignUp();
                  },
                  child: const Text('Need an account? Register'))
            ]),
          ),
        ),
      ),
    );
  }
}






















// class LoginPage extends StatefulWidget {
//   final toggle;
//   const LoginPage({required this.toggle});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   String inputEmail = '';
//   String inputPassword = '';
//   String errorMessage = '';
//   final Authentication _auth = Authentication();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.black,
//         body: SafeArea(
//             child: Center(
//                 child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 color: Colors.tealAccent,
//                 Icons.music_note,
//                 size: 100,
//               ),
//               SizedBox(height: 75),

//               //Hello again!
//               Text(
//                 'Hello Again!',
//                 style: TextStyle(
//                     color: Colors.teal,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 36),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'Welcome back you\'ve been missed!',
//                 style: TextStyle(
//                   color: Colors.teal,
//                   fontSize: 20,
//                 ),
//               ),
//               SizedBox(height: 50),

//               //email textfield
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.teal[200],
//                     border: Border.all(color: Colors.teal),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 20.0),
//                     child: TextFormField(
//                       onChanged: (value) {
//                         setState(() {
//                           inputEmail = value;
//                         });
//                       },
//                       validator: (value) {
//                         if (value == null) {
//                           return 'Please enter in your email';
//                         }
//                       },
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'Email',
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),

//               //password textfield
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.teal[200],
//                     border: Border.all(color: Colors.teal),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 20.0),
//                     child: TextFormField(
//                       onChanged: (value) {
//                         setState(() {
//                           inputPassword = value;
//                         });
//                       },
//                       validator: (value) {
//                         if (value == null) {
//                           return 'Please enter in your password';
//                         }
//                       },
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'Password',
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),

//               //sign in button
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: TextButton(
//                   onPressed: () {},
//                   child: Container(
//                     padding: EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: Colors.teal,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Center(
//                       child: TextButton(
//                         onPressed: () async {
//                           if (_formKey.currentState!.validate()) {
//                             if (_formKey.currentState!.validate()) {
//                               final String? result =
//                                   await _auth.loginUserWithEmailandPassword(
//                                       inputEmail, inputPassword);

//                               if (result != null) {
//                                 setState(() {
//                                   errorMessage = result;
//                                 });
//                               } else {
//                                 setState(() {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => HomePage(),
//                                     ),
//                                   );
//                                 });
//                               }
//                             }
//                           }
//                         },
//                         child: Text(
//                           'Login',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                       // child: Text(
//                       //   'Sign In',
//                       //   style: TextStyle(
//                       //     color: Colors.white,
//                       //     fontWeight: FontWeight.bold,
//                       //     fontSize: 18,
//                       //   ),
//                       // ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 25),

//               // not a member? register here
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Not a member?',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.teal,
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       widget.toggle();
//                     },
//                     child: Text(
//                       ' Register here',
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ))));
//   }
// }

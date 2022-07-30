import 'package:albumplug3/sceens/auth/auth.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  final onClickedLogin;
  SignUpPage({required this.onClickedLogin});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String inputEmail = '';
  String inputName = '';
  String inputPassword = '';
  String errorMessage = '';
  final Authentication _auth = Authentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Register',
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
                      inputName = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please enter in your name';
                    }
                  },
                  decoration: const InputDecoration(
                      hintText: 'Enter your name', icon: Icon(Icons.person)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null) {
                      return 'Please enter in your email';
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      inputEmail = value;
                    });
                  },
                  decoration: const InputDecoration(
                      hintText: 'Enter your email', icon: Icon(Icons.email)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null) {
                      return 'Please enter in your password';
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      inputPassword = value;
                    });
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: 'Enter your password',
                      icon: Icon(Icons.password)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(errorMessage,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.error)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final String? result =
                            await _auth.createUser(
                                inputEmail, inputPassword, inputName);
                        if (result != null) {
                          setState(() {
                            errorMessage = result;
                          });
                        }
                      }
                    },
                    child: Text('Register')),
              ),
              TextButton(
                  onPressed: () {
                    widget.onClickedLogin();
                  },
                  child: const Text('Already have an account? Login'))
            ]),
          ),
        ),
      ),
    );
  }
}

// class signUpPage extends StatefulWidget {
//   final toggle;

//   signUpPage({required this.toggle});

//   @override
//   State<signUpPage> createState() => _signUpPageState();
// }

// class _signUpPageState extends State<signUpPage> {
//   final _formKey = GlobalKey<FormState>();
//   String inputEmail = '';
//   String inputName = '';
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
//                 'Welcome!',
//                 style: TextStyle(
//                     color: Colors.teal,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 36),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'Make a new account',
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
//                           inputName = value;
//                         });
//                       },
//                       validator: (value) {
//                         if (value == null) {
//                           return 'Please enter in your email';
//                         }
//                       },
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'Name',
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
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'Password',
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
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
//                             final String? result =
//                                 await _auth.registerUserWithEmailandPassword(
//                                     inputName, inputEmail, inputPassword);
//                             if (result != null) {
//                               setState(() {
//                                 errorMessage = result;
//                               });
//                             } else {
//                               setState(() {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => LoginPage(
//                                       toggle: true,
//                                     ),
//                                   ),
//                                 );
//                               });
//                             }
//                           }
//                         },
//                         child: Text(
//                           'Sign up',
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
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
//                     'Already a member?',
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
//                       ' Login here',
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

// // class SignUp extends StatefulWidget {
// //   final toggle;
// //   const SignUp({required this.toggle});

// //   @override
// //   State<SignUp> createState() => _SignUpState();
// // }

// // class _SignUpState extends State<SignUp> {
// //   String inputFirstName = '';
// //   String inputLastName = '';
// //   String inputEmail = '';
// //   String errorMessage = '';
// //   final Authentication _auth = Authentication();
// //   final _formKey = GlobalKey<FormState>();
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         backgroundColor: Colors.black,
// //         body: SafeArea(
// //             child: Center(
// //                 child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //               Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 20.0),
// //               child: Container(
// //                 decoration: BoxDecoration(
// //                   color: Colors.teal[200],
// //                   border: Border.all(color: Colors.teal),
// //                   borderRadius: BorderRadius.circular(12),
// //                 ),
// //                 child: Padding(
// //                   padding: const EdgeInsets.only(left: 20.0),
// //                   child: Form( key: _formKey,
// //                     child: TextField(
// //                       obscureText: true,
// //                       decoration: InputDecoration(
// //                           border: InputBorder.none, hintText: 'Password'),
// //                     ), onChanged: 
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             Icon(
// //               Icons.music_note_sharp,
// //               size: 100,
// //               color: Colors.tealAccent,
// //             ),
// //             SizedBox(height: 75),

// //             //Hello again!
// //             Text(
// //               'Hello There!',
// //               style: TextStyle(
// //                 fontWeight: FontWeight.bold,
// //                 fontSize: 36,
// //                 color: Colors.teal,
// //               ),
// //             ),
// //             SizedBox(height: 10),
// //             Text(
// //               'Register below with your details',
// //               style: TextStyle(
// //                 color: Colors.teal,
// //                 fontSize: 20,
// //               ),
// //             ),
// //             SizedBox(height: 50),

// //             //email textfield
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 20.0),
// //               child: Container(
// //                 decoration: BoxDecoration(
// //                   color: Colors.teal[200],
// //                   border: Border.all(color: Colors.teal),
// //                   borderRadius: BorderRadius.circular(12),
// //                 ),
// //                 child: Padding(
// //                   padding: const EdgeInsets.only(left: 20.0),
// //                   child: Form( key: _formKey,
// //                     child: TextField( 
// //                       decoration: InputDecoration(
// //                           border: InputBorder.none, hintText: 'Email'), onChanged: ((value) {
// //                             TextFormField(
// // onChanged: (value) {
// // setState(() {
// // inputEmail = value;
// // });
// //                           });
// //                           }
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             // SizedBox(height: 10),

// //             //password textfield
          
// //             SizedBox(height: 10),

// //             //confirm password textfield
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 20.0),
// //               child: Container(
// //                 decoration: BoxDecoration(
// //                   color: Colors.teal[200],
// //                   border: Border.all(color: Colors.teal),
// //                   borderRadius: BorderRadius.circular(12),
// //                 ),
// //                 child: Padding(
// //                   padding: const EdgeInsets.only(left: 20.0),
// //                   child: Form(
// //                     child: TextField(
// //                       obscureText: true,
// //                       decoration: InputDecoration(
// //                           border: InputBorder.none, hintText: 'Confirm Password'),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 10),

// //             //sign in button
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 25.0),
// //               child: TextButton(
// //                 onPressed: () {},
// //                 child: Container(
// //                   padding: EdgeInsets.all(20),
// //                   decoration: BoxDecoration(
// //                     color: Colors.teal,
// //                     borderRadius: BorderRadius.circular(12),
// //                   ),
// //                   child: Center(
// //                     child: Text(
// //                       'Sign In',
// //                       style: TextStyle(
// //                         color: Colors.white,
// //                         fontWeight: FontWeight.bold,
// //                         fontSize: 18,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 25),
// //             // not a member? register here
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 GestureDetector(
// //                   onTap: () {
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (context) => LoginPage(
// //                           toggle: widget.toggle,
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                   child: Text(
// //                     ' Login',
// //                     style: TextStyle(
// //                       color: Colors.blue,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             )),),
// //           ],
// //         ),),),);
// //   }
// // }
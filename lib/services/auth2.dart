import 'package:albumplug3/sceens/auth/auth.dart';
import 'package:flutter/material.dart';

class RegisterScrn extends StatefulWidget {
  final onClickedLogin;
  RegisterScrn({required this.onClickedLogin});
  @override
  State<RegisterScrn> createState() => _RegisterScrnState();
}

class _RegisterScrnState extends State<RegisterScrn> {
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
                        final String? result = await _auth.createUser(
                          inputName,
                          inputEmail,
                          inputPassword,
                        );
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

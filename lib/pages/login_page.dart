import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mrbeanhackathon/services/auth.dart';
import 'package:mrbeanhackathon/screens/authenticate/authenticate.dart';

class LoginPage extends StatefulWidget {
  final Function toggledView;

  const LoginPage({Key? key, required this.toggledView}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _obscureText;
  final _formKey = GlobalKey<FormState>(); // Add this line
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  String error = '';

  @override
  void initState() {
    super.initState();
    _obscureText = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEDACA),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey, // Set the key to the _formKey
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _buildSignInText(),
                    SizedBox(
                      height: 37,
                    ),
                    _buildEmailAddress(),
                    SizedBox(
                      height: 9,
                    ),
                    _buildPassword(),
                    SizedBox(
                      height: 22,
                    ),
                    _buildSignInBtn(),
                    RichText(
                      text: TextSpan(
                        text: 'Don’t have an account ? ',
                        style: TextStyle(
                          color: Color(0xff222222),
                          fontSize: 15,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign up here !',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              fontSize: 15,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                widget.toggledView();
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInText() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 40,
        width: 193,
        child: Text(
          'Sign In',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: 28,
          ),
        ),
      ),
    );
  }

  Widget _buildEmailAddress() {
    return Container(
      height: 64,
      width: 356,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email address',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 37,
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10)),
              keyboardType: TextInputType.emailAddress,
              onChanged: (val) {
                setState(() => email = val);
              },
              validator: (value) {

              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPassword() {
    return Container(
      height: 64,
      width: 356,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          SizedBox(
            height: 37,
            child: TextFormField(
              onChanged: (val) {
                setState(() => password = val);
              },
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {

              },
              obscureText: _obscureText,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSignInBtn() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              dynamic result = await _auth.signIn(email, password);
              if ((result) == null) {
                setState(() => error = "Invalid account");
              }
            }
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(213, 31),
            backgroundColor: Color(0xffDE9D45),
          ),
          child: const Text(
            'Sign in',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
              fontSize: 19,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 9),
        Text(
          error,
          style: TextStyle(color: Colors.red, fontSize: 15),
        )],
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mrbean/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  final Function toggledView;
  const RegisterPage({super.key, required this.toggledView});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var _obscureText;
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  String phonenum = '';
  String username = '';
  String error = '';
  final _formKey = GlobalKey<FormState>();

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
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _buildSignInText(),
                    SizedBox(
                      height: 20,
                    ),
                    _buildUsername(_formKey),
                    SizedBox(
                      height: 9,
                    ),
                    _buildEmailAddress(_formKey),
                    SizedBox(
                      height: 9,
                    ),
                    _buildPhonenum(_formKey),
                    SizedBox(
                      height: 9,
                    ),
                    _buildPassword(_formKey),
                    SizedBox(
                      height: 15,
                    ),
                    _buildSignInBtn(),
                    RichText(
                      text: TextSpan(
                        text: 'Already have an account ? ',
                        style: TextStyle(
                          color: Color(0xff222222),
                          fontSize: 15,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign In here !',
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
          'Sign Up',
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

  Widget _buildEmailAddress(GlobalKey<FormState> formKey) {
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
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              ),
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

  Widget _buildPassword(GlobalKey<FormState> formKey) {
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
              validator: (value) {
              },
              onChanged: (val) {
                setState(() => password = val ?? '');
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
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: _obscureText,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildUsername(GlobalKey<FormState> formKey) {
    return Container(
      height: 64,
      width: 356,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Full name',
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
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              ),
              keyboardType: TextInputType.text,
              onChanged: (val) {
                setState(() => username = val);
                print(val);
              },
              validator: (value) {
             },
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'^[a-zA-Z0-9\u00C0-\u1EF9 ]+$'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }



  Widget _buildPhonenum(GlobalKey<FormState> formKey) {
    return Container(
      height: 64,
      width: 356,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Phone Number',
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
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              ),
              keyboardType: TextInputType.phone,
              onChanged: (val) {
                setState(() => phonenum = val);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
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
              // Form is valid, perform the sign-up action
              dynamic result =
                  await _auth.register(email, password, username, phonenum);
              if ((result) == null) {
                setState(() => error = "Invalid email");
              }
            }
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(213, 31),
            backgroundColor: Color(0xffDE9D45),
          ),
          child: const Text(
            'Sign Up',
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
        )
      ],
    );
  }
}

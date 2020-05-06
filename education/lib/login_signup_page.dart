import 'package:education/input_email_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginSignupPage extends StatefulWidget {
  @override
  _LoginSignupPageState createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Rappid'),
        backgroundColor: Color.fromRGBO(56, 67, 111, 1),
      ),
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: const Text(
                'すでに会員の方は\nこちらからログインしてください',
                style: TextStyle(
                    fontFamily: "ヒラギノ角ゴ ProN W3",
                    fontSize: 20.0,
                    color: Colors.black),
              ),
              padding: const EdgeInsets.only(top: 45, bottom: 38),
              alignment: Alignment.center,
            ),
            Container(
              padding: const EdgeInsets.only(top: 0, bottom: 10),
              child: Divider(
                height: 2.0,
                //indent: 0.0,
                color: Colors.black,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'メールアドレス',
                      hintText: '入力してください',
                      contentPadding: EdgeInsets.only(left: 40),
                      border: InputBorder.none,
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Divider(
                      height: 2.0,
                      //indent: 0.0,
                      color: Colors.black,
                    ),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    inputFormatters: [
                      WhitelistingTextInputFormatter(RegExp("[a-z,A-Z,0-9]")),
                    ],
                    decoration: const InputDecoration(
                      labelText: 'パスワード',
                      hintText: '6文字以上の英数字',
                      contentPadding: EdgeInsets.only(left: 40),
                      border: InputBorder.none,
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (value.length < 6) {
                        return '6文字以上の英数字を入力してください';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 0),
              child: Divider(
                height: 2.0,
                //indent: 0.0,
                color: Colors.black,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20, bottom: 40),
              child: FlatButton(
                onPressed:(){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InputEmailPage()));
                  },
                child: Text(
                  "パスワードを忘れた方はこちら",
                  style: TextStyle(
                      fontFamily: "ヒラギノ角ゴ ProN W3",
                      fontSize: 20.0,
                      color: Color.fromRGBO(32, 83, 253, 1),
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
            Container(
              color: Color.fromRGBO(239, 17, 17, 1),
              width: 255,
              height: 40,
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.black),
                highlightedBorderColor: Colors.black,
                textColor: Colors.white,
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _signInWithEmailAndPassword();
                  }
                },
                child: Text(
                  "ログイン",
                  style: TextStyle(
                    fontFamily: "ヒラギノ角ゴ ProN W3",
                    fontSize: 20.0,
                    // color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  test() {
    print("item");
  }

  void _signInWithEmailAndPassword() async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )).user;

    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      _success = false;
    }
  }
  navigateTo(name) {
    Navigator.of(context).pushNamed(name);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

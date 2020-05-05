import 'package:education/input_passward_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class InputEmailPage extends StatefulWidget {
  @override
  _InputEmailPageState createState() => _InputEmailPageState();
}

class _InputEmailPageState extends State<InputEmailPage> {
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
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: const Text(
                '登録したメールアドレスを\n入力してください',
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
                    padding: const EdgeInsets.only(top: 10, bottom: 40),
                    child: Divider(
                      height: 2.0,
                      //indent: 0.0,
                      color: Colors.black,
                    ),
                  ),
                ],
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
                  "パスワード再設定",
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
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => InputPasswardPage()));

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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';

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
      resizeToAvoidBottomPadding: false,
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
                      _userEmail = value;
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (!isEmail(value)) {
                        return '正しいメールを入力してください';
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
                    _passwordSetting();
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

  /// email format
  final String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";

  /// is email
  bool isEmail(String input) {
    if (input == null || input.isEmpty) return false;
    return new RegExp(regexEmail).hasMatch(input);
  }

  navigateTo(name) {
    Navigator.of(context).pushNamed(name);
  }

  //sendPasswordResetEmailメソッドを使用して、ユーザーのパスワードを設定
  Future _passwordSetting() async {
    await _auth.sendPasswordResetEmail(email: _userEmail).then((val){
      Navigator.pop(context);
    }).catchError((error) {
      print("ERROR=> $error");
      Flushbar(
        message: "メールアドレスが登録されていません",
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(8),
        borderRadius: 8,
        duration: Duration(seconds: 3),
      )..show(context);
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

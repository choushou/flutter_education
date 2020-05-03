import 'dart:io';
import 'package:flutter_share_go/flutter_share_go.dart';
import 'package:flutter/material.dart';

class DraggablePage extends StatefulWidget {
  @override
  _DraggablePageState createState() => _DraggablePageState();
}

class _DraggablePageState extends State<DraggablePage> {
  List<String> _items1 = List<String>.generate(2, (it) => 'item $it');
  List<String> _items2 = List<String>.generate(2, (it) => 'item $it');
  List<String> _items3 = List<String>.generate(2, (it) => 'item $it');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('本日のタスク'),
        backgroundColor: Color.fromRGBO(56, 67, 111, 1),
      ),
      body: new CustomScrollView(
        shrinkWrap: true,
        // 内容
        slivers: <Widget>[
          new SliverPadding(
            padding: const EdgeInsets.only(left: 0, right: 0),
            sliver: new SliverList(
              delegate: new SliverChildListDelegate(
                <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        padding:
                            const EdgeInsets.only(left: 13, top: 12, bottom: 7),
                        child: Text(
                          "予定項目",
                          style: TextStyle(
                              fontFamily: "ヒラギノ角ゴ ProN W3",
                              fontSize: 24.0,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        child: GestureDetector(
                          child: Container(
                            height: 248,
                            width: MediaQuery.of(context).size.width - 26,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              //setting border
                              border: Border.all(
                                //border color
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return _createGridView(_items1);
                              },
                              onAccept: (String data) {
                                setState(() {
                                  _items1.add(data);
                                });
                              },
                            ),
                          ),
                          onTap: testOne,
                        ),
                      ),

                      Row(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(
                                left: 13, top: 12, bottom: 7),
                            child: Text(
                              "復習項目",
                              style: TextStyle(
                                  fontFamily: "ヒラギノ角ゴ ProN W3",
                                  fontSize: 24.0,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),

                      //SizedBox(height: 210),

                      Container(
                        child: GestureDetector(
                          child: Container(
                            height: 248,
                            width: MediaQuery.of(context).size.width - 26,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              //setting border
                              border: Border.all(
                                //border color
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return _createGridView(_items2);
                              },
                              onAccept: (String data) {
                                setState(() {
                                  _items2.add(data);
                                });
                              },
                            ),
                          ),
                          onTap: testOne,
                        ),
                      ),

                      Row(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(
                                left: 13, top: 12, bottom: 7),
                            child: Text(
                              "終了項目",
                              style: TextStyle(
                                  fontFamily: "ヒラギノ角ゴ ProN W3",
                                  fontSize: 24.0,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),

                      Container(
                        child: GestureDetector(
                          child: Container(
                            height: 248,
                            width: MediaQuery.of(context).size.width - 26,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              //setting border
                              border: Border.all(
                                //border color
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return _createGridView(_items3);
                              },
                              onAccept: (String data) {
                                setState(() {
                                  _items3.add(data);
                                });
                              },
                            ),
                          ),
                          onTap: testOne,
                        ),
                      ),

                      Row(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(top: 18, left: 13),
                            child: pictureTwitter('images/twitter.png'),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 18),
                            //「Twitterで共有」ボタン
                            child: picAndTextButton(
                                'images/twitter_back_image.png',
                                "images/twitter_common.png"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 31, left: 13),
                    child: Text(
                      "フッターメニュー",
                      style: TextStyle(
                          fontFamily: "ヒラギノ角ゴ ProN W3",
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Color.fromRGBO(203, 0, 0, 1)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 0, right: 0, top: 2.5),
                    child: Divider(
                      height: 2.0,
                      //indent: 0.0,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 80,
                          padding: const EdgeInsets.only(top: 17),
                          child: footerMenu("本日の\nタスク", test),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 17),
                          width: 70,
                          child: footerMenu("予定\n管理", test),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 17),
                          width: 70,
                          child: footerMenu("目標\n管理", test),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 17, right: 10),
                          width: 80,
                          child: footerMenu("連絡", test),
                        ),
                        Container(
                          width: 100,
                          child: footerMenu("メニュー", test),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget pictureTwitter(String imgpath) {
    return Container(
      width: 41,
      height: 31,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage(imgpath), fit: BoxFit.fill),
      ),
    );
  }

  Widget footerMenu(String text, VoidCallback onPressed) {
    return Container(
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              fontFamily: "ヒラギノ角ゴ ProN W3",
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
    );
  }

  Widget picAndTextButton(String imagePathOne, String imagePathTwo) {
    return Container(
      width: 119,
      height: 31,
      decoration: BoxDecoration(
        color: Colors.white,
        image:
            DecorationImage(image: AssetImage(imagePathOne), fit: BoxFit.fill),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 7),
        child: FlatButton(
          onPressed: () async {
            FlutterShareGo.shareToTwitterPlatform(
                "test share to twitter content", "http://tryenough.com");
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imagePathTwo), fit: BoxFit.fill),
            ),
          ),
        ),
      ),
    );
  }

  test() {
    print("item");
  }

  testOne() {
    print("Container");
  }

  Widget _createGridView(List<String> _items) {
    return GridView.builder(
      itemCount: _items.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(1),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 0,
          childAspectRatio: 8.6),
      itemBuilder: (context, index) {
        return Draggable<String>(
          onDragCompleted: () {
            // ドラッグ終わったらデータを削除する
            setState(() {
              _items.removeAt(index);
            });
          },

          childWhenDragging: Container(
            color: Colors.blueAccent,
            alignment: Alignment.center,
            foregroundDecoration: BoxDecoration(color: Colors.white30),
            child: Text(
              // _items[index],
              "数学" + "  " + "チャートIA 場合の数 例題" + "  " + "13",
              style: TextStyle(color: Colors.white),
            ),
          ),
          feedback: Material(
            child: Container(
              height: (MediaQuery.of(context).size.width - 26) / 8.6,
              width: MediaQuery.of(context).size.width - 28,
              color: Colors.blueAccent,
              alignment: Alignment.center,
              child: Text(
                // _items[index],
                "数学" + "  " + "チャートIA 場合の数 例題" + "  " + "13",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          // 当コンポーネントのデータ
          data: _items[index],
          child: GestureDetector(
            child: Container(
              color: Colors.blueAccent,
              alignment: Alignment.center,
              child: Text(
                // _items[index],
                "数学" + "  " + "チャートIA 場合の数 例題" + "  " + "13",
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: test,
          ),
        );
      },
    );
  }
}

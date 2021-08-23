import 'package:flutter/material.dart';

void main() {
  runApp(PaddingPlugin());
}

class PaddingPlugin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Padding"),
      ),
      body: Padding(
        //上下左右各添加16像素補白
        padding: EdgeInsets.all(16.0),
        child: Column(
          //顯式指定對齊方式為左對齊，排除對齊干擾
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //左邊添加20像素補白
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                child: Text("左邊添加20像素補白"),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1)),
              ),
            ),

            //上下各添加80像素補白
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 80.0),
              child: Container(
                child: Text("上下各添加80像素補白"),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1)),
              ),
            ),

            // 分別指定四個方向的補白20像素
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              child: Container(
                child: Text("分別指定四個方向的補白"),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

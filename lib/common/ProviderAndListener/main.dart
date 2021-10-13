import 'package:flutter/material.dart';
import 'MyCountChangeNotifier.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //在 widget 元件樹中的最上層，使用 provider ，方便傳遞到其他底層頁面
    //建議採用 MultiProvider，因為一個 APP 很少一個 provider 就夠用，所以直接上 MultiProvider 。
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: MyCountChangeNotifier())],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

//
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //透過 Provider.of 來獲取資料
    final counter = Provider.of<MyCountChangeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('HKT 線上教室'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '目前計數值: ${counter.count}',
            ),
            TextButton(
              //點擊按鈕後，導轉跳到B頁
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => BPage()),
              ),
              child: Text('跳到B頁'),
            ),
          ],
        ),
      ),
    );
  }
}

class BPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('B頁'),
      ),
      body: Center(
        // 透過 Consumer 來接收更改對應資料
        child: Consumer<MyCountChangeNotifier>(builder: (context, counter, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '目前計數值:',
              ),
              Text(
                '${counter.count}',
              ),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 使用 Provider.of，並且將 listen 設定為 false(若沒設定，預設為 true)，
          // 則不會再次調用 Widget 重新構建（ build ）畫面 ，更省效能。
          Provider.of<MyCountChangeNotifier>(context, listen: false)
              .increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_learning/Common/ProviderAndListener/ChangeNotifier.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //在 widget 元件樹中的最上層，使用 provider ，方便傳遞到其他底層頁面
    //建議採用 MultiProvider，因為一個 APP 很少一個 provider 就夠用，所以直接上 MultiProvider 。
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Page1ChangeNotifier()),
        ChangeNotifierProvider.value(value: Page2ChangeNotifier())
      ],
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
    final first = Provider.of<Page1ChangeNotifier>(context);
    final second = Provider.of<Page2ChangeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('HKT 線上教室'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '目前計數值: ${first.count + second.result}',
            ),
            TextButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Page1()),
              ),
              child: Text('Page1'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Page2()),
              ),
              child: Text('Page2'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page1'),
      ),
      body: Center(
        // 透過 Consumer 來接收更改對應資料
        child: Consumer<Page1ChangeNotifier>(builder: (context, counter1, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '目前First值:',
              ),
              Text(
                '${counter1.count}',
              ),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 使用 Provider.of，並且將 listen 設定為 false(若沒設定，預設為 true)，
          // 則不會再次調用 Widget 重新構建（ build ）畫面 ，更省效能。
          Provider.of<Page1ChangeNotifier>(context, listen: false).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Page1'),
        ),
        body: Center(
          // 透過 Consumer 來接收更改對應資料
          child: Consumer<Page2ChangeNotifier>(builder: (context, counter2, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '目前Second值:',
                ),
                Text(
                  '${counter2.value}',
                ),
              ],
            );
          }),
        ),
        floatingActionButton:
            Wrap(direction: Axis.horizontal, children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              // 使用 Provider.of，並且將 listen 設定為 false(若沒設定，預設為 true)，
              // 則不會再次調用 Widget 重新構建（ build ）畫面 ，更省效能。
              Provider.of<Page2ChangeNotifier>(context, listen: false).add();
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              // 使用 Provider.of，並且將 listen 設定為 false(若沒設定，預設為 true)，
              // 則不會再次調用 Widget 重新構建（ build ）畫面 ，更省效能。
              Provider.of<Page2ChangeNotifier>(context, listen: false)
                  .minus()();
            },
            child: const Icon(Icons.remove),
          ),
        ]));
  }
}

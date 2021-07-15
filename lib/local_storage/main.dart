import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

void main() {
  runApp(new LocalStoragePlugin());
}

class LocalStoragePlugin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class Word {
  String wordContent;

  Word({
    required this.wordContent,
  });

  toJSONEncodable() {
    Map<String, dynamic> wordMap = new Map();

    wordMap['wordContent'] = wordContent;

    return wordMap;
  }
}

class Dictionary {
  List<Word> items = [];

  toJSONEncodable() {
    return items.map((item) {
      return item.toJSONEncodable();
    }).toList();
  }
}

class _MyHomePageState extends State<HomePage> {
  final Dictionary list = new Dictionary();
  final LocalStorage storage = new LocalStorage('local_storage_name');
  bool initialized = false;
  TextEditingController controller = new TextEditingController();

  _addItem(String wordContent) {
    setState(() {
      final item = new Word(wordContent: wordContent);
      list.items.add(item);
      _saveToStorage();
    });
  }

  _saveToStorage() {
    storage.setItem('key_in_storage', list.toJSONEncodable());
  }

  _clearStorage() async {
    await storage.clear();

    setState(() {
      list.items = storage.getItem('key_in_storage') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Local Storage'),
      ),
      body: Container(
          padding: EdgeInsets.all(10.0),
          constraints: BoxConstraints.expand(),
          child: FutureBuilder(
            future: storage.ready,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (!initialized) {
                var items = storage.getItem('key_in_storage');

                if (items != null) {
                  list.items = List<Word>.from(
                    (items as List).map(
                      (item) => Word(
                        wordContent: item['wordContent'],
                      ),
                    ),
                  );
                }

                initialized = true;
              }

              List<Widget> widgets = list.items.map((item) {
                return Text(item.wordContent);
              }).toList();

              return Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: ListView(
                      children: widgets,
                      itemExtent: 50.0,
                    ),
                  ),
                  ListTile(
                    title: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        labelText: 'Word to Save:',
                      ),
                      onEditingComplete: _save,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.save),
                          onPressed: _save,
                          tooltip: 'Save',
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: _clearStorage,
                          tooltip: 'Clear storage',
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }

  void _save() {
    _addItem(controller.value.text);
    controller.clear();
  }
}

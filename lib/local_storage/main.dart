import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

void main() {
  runApp(new LocalStoragePlugin());
}

//Define the Word Class: A sigle Word only contains a String as content,
//and Word Class is JSONEncodable to be stored
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

//Define the Dictionary Class: Dictionary contains a wordlist as its content,
//and Dictionary is also toJSONEncodeable to be store
class Dictionary {
  List<Word> wordlist = [];

  toJSONEncodable() {
    return wordlist.map((item) {
      return item.toJSONEncodable();
    }).toList();
  }
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

class _MyHomePageState extends State<HomePage> {
  final Dictionary dict = new Dictionary();
  final LocalStorage storage = new LocalStorage('local_storage_name');
  bool initialized = false;
  TextEditingController controller = new TextEditingController();

  //Define the functions for performing local storage

  //Save the Dictionary to the local storage
  _saveToStorage() {
    storage.setItem('key_in_storage', dict.toJSONEncodable());
  }

  //Add the Word into the Dictionary, and save the Dictionary to local storage
  _addItem(String wordContent) {
    setState(() {
      final item = new Word(wordContent: wordContent);
      dict.wordlist.add(item);
      _saveToStorage();
    });
  }

  //Save Function of save button
  void _save() {
    _addItem(controller.value.text);
    controller.clear();
  }

  //Clear all local storage data
  _clearStorage() async {
    await storage.clear();
    setState(() {
      dict.wordlist = storage.getItem('key_in_storage') ?? [];
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
                var wordlist = storage.getItem('key_in_storage');

                if (wordlist != null) {
                  dict.wordlist = List<Word>.from(
                    (wordlist as List).map(
                      (item) => Word(
                        wordContent: item['wordContent'],
                      ),
                    ),
                  );
                }

                initialized = true;
              }

              List<Widget> widgets = dict.wordlist.map((item) {
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
}

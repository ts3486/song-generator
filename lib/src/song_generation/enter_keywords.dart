import 'package:flutter/material.dart';

class EnterKeyWordsWidget extends StatefulWidget {
  const EnterKeyWordsWidget({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  EnterKeyWordsWidgetState createState() => EnterKeyWordsWidgetState();
}

class EnterKeyWordsWidgetState extends State<EnterKeyWordsWidget> {
  String _keyword = "";
  List<String> _keywords = []; // The state variable that you want to change.

  // _setKeyword(v) {
  //   setState(() {
  //     _keyword = v; // This call to setState tells Flutter to rerender the widget.
  // });

  void _addKeyword(keyword) {
    setState(() {
      _keywords.add(
          keyword); // This call to setState tells Flutter to rerender the widget.
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method builds the UI with current state of _counter.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Song Generator'),
      ),
      body: Column(children: <Widget>[
        //Input section
        SizedBox(
            height: 230,
            child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      const Text(
                        'Enter Song Keywords',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Keyword',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _keyword = value;
                          });
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange[300],
                            foregroundColor: Colors.black,
                            shape: const StadiumBorder(),
                            minimumSize: const Size(150, 50)),
                        onPressed: () => {_addKeyword(_keyword)},
                        child: const Text(
                          'Add Keyword',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ]))),
        //Display Section
        SizedBox(
            height: 230,
            child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Chip(
                        labelPadding: const EdgeInsets.all(2.5),
                        // avatar: CircleAvatar(
                        //   backgroundColor: Colors.white70,
                        //   child: Text(_keywords[0].toUpperCase()),
                        // ),
                        label: const Text(
                          'keyword1',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.blue[300],
                        elevation: 6.0,
                        shadowColor: Colors.grey[60],
                        deleteIcon: const Icon(Icons.close),
                        onDeleted: () {},
                      ),
                    ]))),
      ]),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: _addKeyword(_keyword),
      //   tooltip: 'Add',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

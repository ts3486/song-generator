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

  _addKeyword(keyword) {
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
        title: const Text('Counter Example'),
      ),
      body: const Center(
          child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
        ),
      )),

      floatingActionButton: FloatingActionButton(
        onPressed: _addKeyword(_keyword),
        tooltip: 'Add',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

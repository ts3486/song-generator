import 'package:flutter/material.dart';

class EnterKeyWordsWidget extends StatefulWidget {
  const EnterKeyWordsWidget({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  EnterKeyWordsWidgetState createState() => EnterKeyWordsWidgetState();
}

class EnterKeyWordsWidgetState extends State<EnterKeyWordsWidget> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _keywords =
      []; // The state variable that you want to change.

  bool get _isKeywordMaxed => _keywords.length >= 3;

  void _addKeyword(keyword) {
    setState(() {
      final keyword = _textController.text;
      _keywords.add(
          keyword); // This call to setState tells Flutter to rerender the widget.
      _textController.clear();
    });
  }

  @override
  void dispose() {
    _textController.dispose(); // Don't forget to dispose of the controller
    super.dispose();
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
                        'Enter Up To 3 Keywords',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      TextField(
                        controller: _textController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Keyword',
                        ),
                      ),
                      if (!_isKeywordMaxed) ...[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange[300],
                              foregroundColor: Colors.black,
                              shape: const StadiumBorder(),
                              minimumSize: const Size(150, 50)),
                          onPressed: () => {_addKeyword(_textController.text)},
                          child: const Text(
                            'Add Keyword',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ] else ...[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[400],
                              foregroundColor: Colors.black,
                              shape: const StadiumBorder(),
                              minimumSize: const Size(150, 50)),
                          onPressed: () => {_addKeyword(_textController.text)},
                          child: const Text(
                            'Next',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ]))),
        //Display Section
        SizedBox(
            height: 230,
            child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(children: <Widget>[
                  const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('Selected Keywords:',
                          style: TextStyle(color: Colors.white))),
                  Wrap(
                      children:
                          List<Widget>.generate(_keywords.length, (int idx) {
                    return Chip(
                      labelPadding: const EdgeInsets.all(2.5),
                      label: Text(
                        _keywords[idx],
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.blue[300],
                      elevation: 6.0,
                      shadowColor: Colors.grey[60],
                      deleteIcon: const Icon(Icons.close),
                      onDeleted: () {
                        setState(() {
                          //remove selected keyword chip
                          _keywords.remove(_keywords[idx]);
                        });
                      },
                    );
                  }))
                ])))
      ]),
    );
  }
}

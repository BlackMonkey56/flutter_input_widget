import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextCtrl = new TextEditingController();

  String inputStr = "";

  bool enabled = false;
  bool expanded = false;
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(
                  hintText: 'Write something!'
              ),
              onChanged: (String textInput) {
                setState(() {
                  inputStr = TextCtrl.text.length.toString();
                });
              },
              controller: TextCtrl,
            ),//TextField
            new Text(inputStr),
            new Switch(
              onChanged: (bool val){
                setState(() {
                  enabled = val;
                });
              },
              activeColor: Colors.green,
              activeTrackColor: Colors.greenAccent[400],
              value: enabled,
            ),//Switch
            new ExpansionPanelList(
              expansionCallback: (i, bool val){
                setState(() {
                  expanded = !val;
                });
              },
              children: [
                new ExpansionPanel(
                  body: new Container(
                    padding: EdgeInsets.all(20.0),
                    child: new Text('Hello'),
                  ),//Container
                  headerBuilder: (BuildContext context, bool val){
                    return new Center(
                      child: new Text('Tap on me',
                        style: new TextStyle(fontSize: 18.0)
                      ),//Text
                    );//Center
                  },
                  isExpanded: expanded,
                ),//ExpansionPanel
              ],//[]
            ),//ExpansionPanelList
            new Checkbox(
              onChanged: (bool val) {
                setState(() {
                  checked = val;
                });
              },
              value: checked,
              activeColor: Colors.red,
            ),//Checkebox
          ],//<Widget>[]
        ),//Column
      ),//Container
    );//Scaffold
  }
}

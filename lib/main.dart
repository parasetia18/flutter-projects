import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String texttodisplay = "";
  String res;
  String operetor;
  int firstnum, secondnum;

  void calcul(String inp) {
    if (inp == "C") {
      texttodisplay = "";
      firstnum = 0;
      secondnum = 0;
      operetor = "";
      res = "";
    } else if (inp == "+" || inp == "-" || inp == "x" || inp == "/") {
      firstnum = int.parse(texttodisplay);
      res = "";
      operetor = inp;
    } else if (inp == "=") {
      secondnum = int.parse(texttodisplay);
      if (operetor == "+") {
        res = (firstnum + secondnum).toString();
      }
      if (operetor == "-") {
        res = (firstnum - secondnum).toString();
      }
      if (operetor == "x") {
        res = (firstnum * secondnum).toString();
      }
      if (operetor == "/") {
        res = (firstnum ~/ secondnum).toString();
      }
    } else {
      res = int.parse(texttodisplay + inp).toString();
    }
    setState(() {
      texttodisplay = res;
    });
  }

  Widget button(String btnval) {
    return Expanded(
        child: OutlineButton(
      padding: EdgeInsets.all(25.0),
      onPressed: () => calcul(btnval),
      child: Text(
        "$btnval",
        style: TextStyle(fontSize: 26.0, color: Colors.deepPurple),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Calculate your Expression"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  "$texttodisplay",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 25.0,
                      color: Colors.black87),
                ),
              ),
            ),
            Row(
              children: [
                button("9"),
                button("8"),
                button("7"),
                button("+"),
              ],
            ),
            Row(
              children: [
                button("6"),
                button("5"),
                button("4"),
                button("-"),
              ],
            ),
            Row(
              children: [
                button("3"),
                button("2"),
                button("1"),
                button("x"),
              ],
            ),
            Row(
              children: [
                button("C"),
                button("0"),
                button("="),
                button("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

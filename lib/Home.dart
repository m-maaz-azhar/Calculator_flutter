import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var result = "";

  Widget btn(var numTxt) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            result = result + numTxt;
          });
        },
        child: Text(numTxt));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("CALCULATOR",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black87))),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            color: Colors.grey[300],
            width: MediaQuery.of(context).size.width * 0.80,
            child: Text(
              result,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [btn("7"), btn("8"), btn("9"), btn("/")],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [btn("4"), btn("5"), btn("6"), btn("*")],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [btn("1"), btn("2"), btn("3"), btn("-")],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn("0"),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = "";
                    });
                  },
                  child: Text("Clear")),
              ElevatedButton(
                  onPressed: () {
                    Parser p = Parser();
                    Expression exp = p.parse(result);
                    ContextModel cm = ContextModel();
                    double eval = exp.evaluate(EvaluationType.REAL, cm);
                    setState(() {
                      result = eval.toString();
                    });
                  },
                  child: Text("=")),
              btn("+")
            ],
          )
        ],
      ),
    );
  }
}

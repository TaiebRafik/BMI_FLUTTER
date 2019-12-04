import 'package:flutter/material.dart';

class HomeState extends State {
  final TextEditingController _Age = new TextEditingController();
  final TextEditingController _Poid = new TextEditingController();
  final TextEditingController _Taille = new TextEditingController();
  String _resultReading="";
  double r = 0.0;

  void CalculeBmi() {
    //Resourse 1: https://www.bcbst.com/providers/MPMTools/BMICalculator.shtm
    //Resource 2:  http://www.epic4health.com/bmiformula.html

//
//    BMI	Weight Status
//    Below 18.5	Underweight
//    18.5 – 24.9	Normal
//    25.0 – 29.9	Overweight
//    30.0 and Above	Obese
    setState(() {
      int age = int.parse(_Age.text);
      double taille = double.parse(_Taille.text);
      double poid = double.parse(_Poid.text);
      if (_Poid.text.isNotEmpty &&
          (_Age.text.isNotEmpty || age > 0) &&
          _Taille.text.isNotEmpty) {
        r = poid / (taille * taille) * 10000;
        print("poid = $poid \ntaille = $taille Age= $age");
        print("\nBmi= $r");
        //Do the reading
        if (double.parse(r.toStringAsFixed(1)) < 18.5) {
          _resultReading = "Underweight";
          print(_resultReading);

        }else if (double.parse(r.toStringAsFixed(1)) >= 18.5
            && r < 25) {
          _resultReading = "Great Shape!"; // Normal
          print(_resultReading);
        }else if (double.parse(r.toStringAsFixed(1)) >= 25.0
            && r < 30) {
          _resultReading = "Overweight";
        }else if (double.parse(r.toStringAsFixed(1)) >= 30.0) {
          _resultReading = "Obese";
        }

      }else{
        print("erreur dans les donner entrer");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        title: new Text(
          "BMI",
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: new Container(
        alignment: Alignment.center,
        child: new ListView(
          padding: const EdgeInsets.all(1.5),
          children: <Widget>[
            new Image.asset(
              "images/bmilogo.png",
              height: 100,
              width: 100,
            ),
            new Container(
              color: Colors.grey.shade300,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _Age,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        icon: new Icon(Icons.person_outline), labelText: "age"),
                  ),
                  new TextField(
                    controller: _Taille,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        icon: new Icon(Icons.insert_chart),
                        labelText: "taille"),
                  ),
                  new TextField(
                    controller: _Poid,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        icon: new Icon(Icons.line_weight), labelText: "poid"),
                  ),
                  new Container(
                    margin: const EdgeInsets.all(38.0),
                    child: new RaisedButton(
                      onPressed:CalculeBmi,
                      color: Colors.pinkAccent.shade400,
                      child: new Text(
                        "Calculate",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "BMI : ${r.toStringAsFixed(2)}",
                  style: new TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 20.0),
                ),
                new Padding(padding: const EdgeInsets.all(5.0)),
                new Text(
                  "Resultat:$_resultReading",
                  style: new TextStyle(
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 20.0),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _weightContorller = new TextEditingController();

  int radioValue = 0;
  double _finalResut = 0.0;
  void handLeRadioValueChanged(int value){
    setState(() {
      radioValue = value;

      switch(radioValue){
        case 0:
          _finalResut = calculateWeight(_weightContorller.text, 0.06);
          break;

        case 1:
          _finalResut   = calculateWeight(_weightContorller.text,0.38);
          break;

        case 2:
          _finalResut   = calculateWeight(_weightContorller.text,0.91);
          break;
      }


    });
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight on Planet x"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(20.5),
          children: <Widget>[
            new Image.asset(
              "images/planet.png",
              height: 133.8,
              width: 200.0,
            ),
            new Container(
              margin: const EdgeInsets.all(09.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightContorller,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Your Weigh on Earth",
                        hintText: "in Prouds",
                        icon: new Icon(Icons.person_outline)),
                  ),

                  new Padding(padding: new EdgeInsets.all(10.0)),
                  //there radio buttons
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //radio buttons
                      new Radio<int>(
                        activeColor: Colors.orange,
                        value: 0,
                        groupValue: radioValue,
                        onChanged: handLeRadioValueChanged,
                      ),

                      new Text(
                        "Nazmus",
                        style: new TextStyle(color: Colors.white),
                      ),

                      new Radio<int>(
                        activeColor: Colors.white,
                        value: 1,
                        groupValue: radioValue,
                        onChanged: handLeRadioValueChanged,
                      ),

                      new Text(
                        "Sakib",
                        style: new TextStyle(color: Colors.white),
                      ),

                      new Radio<int>(
                        activeColor: Colors.purple,
                        value: 2,
                        groupValue: radioValue,
                        onChanged: handLeRadioValueChanged,
                      ),

                      new Text(
                        "JONY",
                        style: new TextStyle(color: Colors.white),
                      ),



                    ],
                  ),

                new Padding(padding: new EdgeInsets.all(15.8)),
                  //Restul Text..
                  new Text(
                    "$_finalResut",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize:  20.5,
                      fontWeight: FontWeight.w500,
                    ),
                  )



                ],
              ),




            )
          ],
        ),
      ),
    );
  }

 double calculateWeight(String weight, double multipler) {

    if(int.parse(weight).toString().isEmpty && int.parse(weight)> 0){

      return int.parse(weight) * multipler;
    }else{
      print("Wrong!");
      return int.parse("180") * 0.38;
    }

 }


}













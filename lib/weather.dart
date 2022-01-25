import 'package:flutter/material.dart';
import './weather-details.dart';

class Weather extends StatefulWidget{
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String city="" ;
  TextEditingController cityEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(city), backgroundColor: Colors.deepOrangeAccent,),
      body: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(hintText: 'Tape a City..'),
                style: TextStyle(fontSize: 22),
                controller: cityEditingController,
                onChanged: (String str){
                  setState(() {
                    city = str ;
                  });
                },
                onSubmitted: (value){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WeatherDetails(city)));
                  cityEditingController.text="";
                },
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WeatherDetails(city)));
                  cityEditingController.text="";
                },
                color: Colors.deepOrangeAccent,
                child: Text('Get Wheather ...', style: TextStyle(fontSize: 22, color: Colors.white)),
              ),
            )
          )
        ],
      )
    );
  }
}
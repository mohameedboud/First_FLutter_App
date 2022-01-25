import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WeatherDetails extends StatefulWidget {
  String city="" ;
  WeatherDetails(this.city);
  @override
  _WeatherDetailsState createState() => _WeatherDetailsState();


}

class _WeatherDetailsState extends State<WeatherDetails>{

  var weatherData;

  @override
  void initState(){
    super.initState();
    getData(widget.city);
  }

  getData(String city){
    print("Getting weather of"+city);
    var url= Uri.parse("https://api.openweathermap.org/data/2.5/forecast?q=${city}&appid=d36ea0b64a76aee92c3db75762f205f3");
    http.get(url)
       .then((resp){
         setState(() {
           this.weatherData=json.decode(resp.body);
           print(this.weatherData);
         });
    }).catchError((err){
      print(err);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wheather of city ${widget.city}'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: (weatherData==null?
      Center( child: CircularProgressIndicator(),):
      ListView.builder(
          itemCount: (weatherData==null?0:weatherData['list'].length),
          itemBuilder: (context,index){
            return Card(
              color: Colors.deepOrangeAccent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage("images/${weatherData['list'][index]['weather'][0]['main'].toLowerCase()}.png"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("${new DateFormat('E-dd/MM/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(weatherData['list'][index]['dt']*1000000))}", style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),),
                              Text("${new DateFormat('HH:mm').format(DateTime.fromMicrosecondsSinceEpoch(weatherData['list'][index]['dt']*1000000))} "
                                  "| ${weatherData['list'][index]['weather'][0]['main']}"
                                    , style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        )
                      ],
                    ),
                    Text("${weatherData['list'][index]['wind']['deg'].round()} °C",style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            );
          }
      )
      )
    );
  }

}
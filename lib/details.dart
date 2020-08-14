import 'package:flutter/material.dart';
import 'package:travel_test/models/country_model.dart';



class Details extends StatelessWidget {
final Country country;

Details({Key key, @required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Second Route"),
      ),*/
      body: Stack(
        children: <Widget> [
          Container(
            decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(country.image), fit: BoxFit.fitHeight),
            color: Colors.grey, 
            )
          ),
          
          
          Positioned(
            child:GestureDetector(
              child: Icon(Icons.arrow_back, color: Colors.white, size: 40,),
              onTap: () {
              Navigator.pop(context);
            }
          ),
          top: 40,
          left: 10
          ),          
          Positioned(
            child: Text(country.name, style: TextStyle(fontSize: 40, color: Colors.white)),
            top: 200,
            left: 10,
          ),
          Positioned(child: _schedule(),
            top: 250,
            left: 10,
          ),
          Positioned(child: _position(),
            top: 250,
            left: 100
          ),
          Positioned(child: _contentText(country),
            top: 300,
            left: 10,
          )
        ],
      ) 
      
      
     
    );
  }


  Widget _schedule() {
    return Row(
      children: [
        Icon(Icons.schedule, color: Colors.white),
        Text(" 15 jours", style: TextStyle(color: Colors.white),)
      ],
    );
  }

  Widget _position() {
    return Row(
      children: [
        Icon(Icons.flag, color : Colors.white),
        Text(" 900 kms", style: TextStyle(color: Colors.white),)
      ],
      );
  }

  Widget _contentText(Country country) {
    return Container(
      width: 300,
      height: 300,
      child: 
        Text(country.description, style:  TextStyle(
                  color: Colors.white,
                  fontSize: 20,
        ))
    );
  }
}
import 'package:flutter/material.dart';
import 'package:travel_test/details_book.dart';
import 'package:travel_test/models/country_model.dart';
import 'package:travel_test/utils/details_infos.dart';



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
          
          
          back_button(context),
          Positioned(
            child: Text(country.name, style: TextStyle(fontSize: 40, color: Colors.white)),
            top: 200,
            left: 10,
          ),
          Positioned(child: schedule(),
            top: 250,
            left: 10,
          ),
          Positioned(child: position(),
            top: 250,
            left: 100
          ),
          Positioned(child: GestureDetector(
              child: _contentText(country),
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsBook(country: country)),
              );
              },
            ),
            top: 300,
            left: 10,
          )
        ],
      )      
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
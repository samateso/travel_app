import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_test/details.dart';
import 'package:travel_test/models/country_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      title: "tzqt",
      home : Scaffold(
        appBar: AppBar(
          title: Text('Carousel in vertical scrollable'),
        ),
        body: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          itemBuilder: (BuildContext context, int index) {
            if(index % 2 == 0) {
              return _buildCarousel(context, index ~/ 2);
            }
            else {
              return Divider();
            }
          },
          itemCount: 1,
        ),
      )
    );
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 650.0,
          child: PageView.builder(
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 0.8),
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(context, carouselIndex, itemIndex);
            },
            itemCount: 6,
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0),
      child: FutureBuilder<List<Country>>(
        future: loadJson(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          List<Country> dataCountry = snapshot.data;

          return GestureDetector(
            child:  Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(dataCountry[itemIndex].image), fit: BoxFit.fitHeight),
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Container(
              child: Text(dataCountry[itemIndex].name, 
                textAlign: TextAlign.center,               
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40
                ),
              ),
              alignment: Alignment.bottomCenter),
              
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Details(country: dataCountry[itemIndex])),
              );
            },
          );
          
          
        }
      )

    );
  }
}


Future<List<Country>> loadJson() async {
  String data = await rootBundle.loadString('assets/json/data.json');
  return parseCountry(data);
}

// A function that converts a response body into a List<Country>.
List<Country> parseCountry(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Country>((json) => Country.fromJson(json)).toList();
}

/*

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Horizontal List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: getTechniciansInArea()
          ),
        ),
      ),
    );
  }
}



  List<Country> getTechies() {
    List<Country> techies = [];
    for (int i = 0; i < 10; i++) {
      AssetImage profilePic = new AssetImage("assets/images/congo.png");
      Country myTechy = new Country("Carlos Teller", profilePic);
      techies.add(myTechy);
    }
    return techies;
  }

  List<Widget> getTechniciansInArea() {
    List<Country> countries = getTechies();
    List<Widget> cards = [];
    for (Country ctr in countries) {
      cards.add(countryCard(ctr));
    }
    return cards;
  }



Widget countryCard (Country country) {
  return Container(
    padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(right: 20),
        width: 380,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
          boxShadow: [
        new BoxShadow(
              color: Colors.blue,
              blurRadius: 20.0,
            ),
          ],
        ),
        child: 
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: CircleAvatar(
                    backgroundImage: country.profilePic,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(country.name),
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                children: <Widget>[
                  Text("Status:  ")
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Rating: " )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                    Text("Rating: " )
                    ]
                  )

                ],
              ),
            )
          ],
        ),
      );
}*/

import 'package:flutter/material.dart';
import 'package:travel_test/utils/details_infos.dart';

import 'models/country_model.dart';
import 'models/users_model.dart';


class DetailsBook extends StatelessWidget {

  final Country country;

  DetailsBook({Key key, @required this.country}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(country.image), fit: BoxFit.fitHeight),
            color: Colors.grey, 
            )
          ),
          back_button(context),
          Positioned(child: schedule(),
          top: 200,
          left: 10,
          ),
          Positioned(child: position(),
          top: 240,
          left: 10),
          Positioned(child: 
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    margin: const EdgeInsets.only(left: 20),
                    alignment: Alignment.topLeft,
                    child: Text(country.name, style: TextStyle(fontSize: 40),),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(country.description),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20),
                    child: listIcons(),
                  ),
                  SizedBox(
                    height: 100,                
                    child: listUsers(),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: fromTo(country)),
                  Container(
                    margin: EdgeInsets.only(top:20),                    
                    alignment: Alignment.bottomCenter,
                    child : RaisedButton(
                    onPressed: () {},
                    color: Colors.blue,
                    child: const Text('Commencer la visite', style: TextStyle(fontSize: 20, color: Colors.white),)
                    )
                  )                  
                ],
              ),
            ),
            top: 300,
          )
        ],
      )
    );
  }

  Widget listIcons() {
    return  Row(
      children: [
        Expanded(child: Row( 
          children: [
            Icon(Icons.insert_comment),
            Text("10")
          ])
        ),
        Expanded(child: Row(
          children: [
          Icon(Icons.favorite_border),
          Text("30")
          ])
        ), 
        Expanded(child: Row(
          children: [
          Icon(Icons.star_border),
          Text("26")
        ],) ),
        Expanded(child: Row(children: [
          Icon(Icons.timer),
          Text("14")
        ],) )
      ]
    );
  }

  Widget listUsers() {
    return ListView(
      children: getUsersCard(),
      padding: EdgeInsets.only(top: 10, left: 10),
      scrollDirection: Axis.horizontal,
    );
  }

  List<Users> getUsers() {
    List<Users> users = [];
    for (int i = 0; i < 3; i++) {
      AssetImage profilePic = new AssetImage("assets/images/woman.jpg");
      Users myUser = new Users(1, "Cha Cha",  profilePic);
      users.add(myUser);
    }
    return users;
  }

  List<Widget> getUsersCard() {
    List<Users> users = getUsers();
    List<Widget> cards = [];
    for (Users user in users) {
      cards.add(userCard(user));
    }
    return cards;
  }
}

  Widget userCard(Users user) {
    return Container(
    padding: EdgeInsets.all(10),
        child: 
        Column(
          children: <Widget>[
              Container(
                child: CircleAvatar(
                  backgroundImage: user.image,
                ),
              ),
              Text(user.name),
          ],
        ),
      );
}

  Widget fromTo(Country country) {
    return Container(
      decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(10),

            ),
      child: Row(
        children: [
          Expanded(child: 
          Column(
            children: [
              Text("Départ"),
              Text("France")
            ],
          )),
          Expanded(child: 
          Column(
            children: [
              Text("Arrivée"),
              Text(country.name)

            ],)
          )
        ],
      ),
    );
  }


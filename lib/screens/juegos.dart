import 'package:flutter/material.dart';
import 'package:flutter_provider_example/models/following.dart';
import 'package:flutter_provider_example/screens/comprados.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ListTile eachTile(Following following, String name, String initials) {
    return ListTile(
      title: Text(name),
      leading: CircleAvatar(
        child: Text(initials),
      ),
      trailing: IconButton(
        icon: (following.followingList.contains(name))
            ? Icon(Icons.check)
            : Icon(Icons.add),
        onPressed: () {
          if (following.followingList.contains(name)) {
            following.remove(name);
          } else {
            following.add(name);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Juegos disponibles"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
              child: Text(
                "Ver",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              }),
        ],
      ),
      body: Consumer<Following>(
        builder: (BuildContext context, Following value, Widget child) {
          return ListView(
            children: <Widget>[
              eachTile(value, "God of war", "PS4"),
              eachTile(value, "Saint seiya", "PS4"),
              eachTile(value, "Halo Infinite", "XB"),
              eachTile(value, "Gears of War", "XB"),
              eachTile(value, "Super Smash Bros Ultimate", "SW"),
              eachTile(value, "The Legend of Zelda", "SW"),
              eachTile(value, "League of Legends", "PC"),
              eachTile(value, "World of Warcraft", "PC"),
              eachTile(value, "Candy Crush", "CEL"),
              eachTile(value, "Fruit Ninja", "CEL"),
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_provider_example/models/following.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Juegos Comprados"),
          centerTitle: true,
        ),
        body: Consumer<Following>(
          builder: (BuildContext context, Following value, Widget child) {
            return ListView.builder(
                itemCount: value.followingList.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Text("Seleccionaste:"),
                    );
                  } else {
                    return Center(
                      child: Text(value.followingList[index - 1]),
                    );
                  }
                });
          },
        ));
  }
}

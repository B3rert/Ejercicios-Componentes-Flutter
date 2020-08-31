import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Page"),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text(
                "Kiki",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.deepPurple,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              "https://i.pinimg.com/474x/f8/e0/5e/f8e05ee00e840740785b1035e564e071.jpg"),
          placeholder: AssetImage("assets/jar-loading.gif"),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}

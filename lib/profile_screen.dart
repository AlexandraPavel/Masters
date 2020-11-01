import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'start_button.dart';

class ProfileScreen extends StatelessWidget {
  var milestones = [100, 200, 300];
  var rewards = ["10% discount at electronics", "free frying pan", "everything is 5% off"];
  int points = 50; //Retrieve from firebase

  int getMilestone(int points){
    if(points < milestones[0]) return 0;
    if(points < milestones[1]) return 1;
    if(points < milestones[2]) return 2;
    return -1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/lucica.jpg'),
              ),
              Text(
                'Lucian Danescu',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                ),
              ),
              Text(
                'Your points: ${points}',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                elevation: 10.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '+40 735 783 680',
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 10.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'lucidanescu28@yahoo.com',
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                getMilestone(points) != -1 ? 'Next milestone at ${milestones[getMilestone(points)]}, ${rewards[getMilestone(points)]}' : 'Currently there are no more offers',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
               SizedBox(
                 height: 80,
               ),
              BottomButton(
                buttonTitle: "Start Shopping",
                onTap: (){
                  Navigator.pushNamed(context, "scan_screen");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

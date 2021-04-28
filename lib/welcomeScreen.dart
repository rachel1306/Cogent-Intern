import 'package:flutter/material.dart';
import 'package:cogent_ecomm_app/SignIn.dart';
import 'package:cogent_ecomm_app/SignUp.dart';
class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.purple[200],
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.2),
                BlendMode.dstATop),
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox(
          height: 800,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Text('to the best Shopping app ever!',style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 250,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Color(0xffBCE0FD),
                              Color(0xff4D53F0),
                            ]
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => signUp()));
                          },
                          child: Text('SignUp',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                            ),),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Container(
                          width: 250,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(25)
                          ),
                          child: TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => signIn()));
                            },
                            child: Text('SignIn',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

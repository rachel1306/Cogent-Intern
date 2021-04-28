import 'package:flutter/material.dart';
import 'package:cogent_ecomm_app/InsideApp/SideNavbar/changePass.dart';
import 'package:custom_switch/custom_switch.dart';
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool status=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',style: TextStyle(color: Colors.grey[600]),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 30, 0, 30),
                child: Text('Settings',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 13),
                    child: Icon(Icons.person,color: Color(0xff4D53F0),),
                  ),
                  Text('Account',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                ],
              ),
              Divider(color: Colors.black,),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Text('Edit Profile',style: TextStyle(fontSize: 16),),
                    Spacer(),
                    IconButton(icon: Icon(Icons.arrow_forward_ios_rounded),
                      onPressed: (){
                      },)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Text('Change Password',style: TextStyle(fontSize: 16),),
                    Spacer(),
                    IconButton(icon: Icon(Icons.arrow_forward_ios_rounded),
                      onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => changePassword())); },)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 13),
                      child: Icon(Icons.notifications,color: Color(0xff4D53F0),),
                    ),
                    Text('Notifications',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ],
                ),
              ),
              Divider(color: Colors.black,),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Text('notifications',style: TextStyle(fontSize: 16),),
                    Spacer(),
                    /*AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: toggleValue? Colors.green: Colors.red.withOpacity(0.5)
                      ),
                    ),*/
                    CustomSwitch(
                      activeColor: Colors.pinkAccent,
                      value: status,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          status = value;
                        });
                      },
                    ),
                    //IconButton(icon: Icon(Icons.arrow_forward_ios_rounded),onPressed: (){},)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Text('App notifications',style: TextStyle(fontSize: 16),),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 13),
                      child: ImageIcon(AssetImage('assets/more.png'),color: Color(0xff4D53F0),),
                    ),
                    Text('More',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ],
                ),
              ),
              Divider(color: Colors.black,),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Text('Language',style: TextStyle(fontSize: 16),),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Text('Country',style: TextStyle(fontSize: 16),),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20,top: 50),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[
                            Color(0xffBCE0FD),
                            Color(0xff4D53F0),
                          ]
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 5.0,
                            offset: Offset(0.0, 0.75)
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: (){},
                      child: Text('Edit Profile',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w300
                        ),),
                    ),
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

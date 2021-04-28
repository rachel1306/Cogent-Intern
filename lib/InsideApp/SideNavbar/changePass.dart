import 'package:flutter/material.dart';

class changePassword extends StatefulWidget {
  changePassword({
    @required this.pass,
  });
  final pass;
  @override
  _changePasswordState createState() => _changePasswordState();
}

class _changePasswordState extends State<changePassword> {
  final _newPass=TextEditingController(),_rePass=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                        offset: Offset(0.0, 0.75)
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: null,
                  obscureText: true,
                  validator: (input){
                    if (input == null || input.length<6) {
                      return 'Please enter atleast six characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock,color: Color(0xff4D53F0),),
                    hintText: 'Old Password'
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10,bottom: 20),
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                        offset: Offset(0.0, 0.75)
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: _newPass,
                  obscureText: true,
                  validator: (input){
                    if (input == null || input.length<6) {
                      return 'Please enter atleast six characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock,color: Color(0xff4D53F0),),
                    hintText: 'New Password'
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10,bottom: 20),
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                        offset: Offset(0.0, 0.75)
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: _rePass,
                  obscureText: true,
                  validator: (input){
                    if (input == null || input != _newPass.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock,color: Color(0xff4D53F0),),
                    hintText: 'Re-enter New Password'
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
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
                  child: Text('Submit',
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
    );
  }
}

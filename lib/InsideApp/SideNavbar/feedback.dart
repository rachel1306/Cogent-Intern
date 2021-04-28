import 'package:flutter/material.dart';

class feedback extends StatefulWidget {
  @override
  _feedbackState createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  final _feedBack=TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback',style: TextStyle(color: Colors.grey[600]),),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 80,),
            Text('Your Feedback matters to us!'),
            Center(
              child: SizedBox(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Image.asset('assets/Feedback/sad.png'),
                      onPressed: (){},
                    ),
                    IconButton(
                      icon: Image.asset('assets/Feedback/average.png'),
                      onPressed: (){},
                    ),
                    IconButton(
                      icon: Image.asset('assets/Feedback/happy.png'),
                      onPressed: (){},
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Container(
                width: 300,
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black
                  ),
                ),
                child: TextFormField(
                  controller: _feedBack,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  validator: (value){
                    if(value.isEmpty) return 'Enter text';
                    else return null;
                  },
                ),
              ),
            ),
            Container(
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
                onPressed: (){
                  //_formKey.currentState.validate();
                },
                child: Text('Submit',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w300
                  ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

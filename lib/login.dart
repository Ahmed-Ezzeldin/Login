import 'package:flutter/material.dart';
import './home.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  String userName = '';
  String passWord = '';
  String msg = '';

  final GlobalKey <ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();

  snackBarFun(){
        scaffoldState.currentState.showSnackBar(SnackBar(
      content: Text(msg,style: TextStyle(fontSize: 18,color: Colors.redAccent),),
      duration: Duration(milliseconds: 5000),
      action: SnackBarAction(
        label: 'Ok',
        //ToDo ===================== create a snackbar function
        onPressed: (){},
      ),
    ));
  }
  loginButtonFun() {
    if(userName == '' || passWord == ''){
      msg = 'Enter the Username & Password First';
      snackBarFun();
    }
    else{
      if(userName == 'admin' && passWord == '0000'){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> Home()));
      }
      else{
        msg = 'Username or Password is Incorrect Please input again';
        snackBarFun();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Card(
              elevation: 10,
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.person,
                    size: 150,
                    color: Theme.of(context).primaryColor,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'User Name',
                      ),
                      onChanged: (String value) {
                        userName = value;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      onChanged: (String value) {
                        passWord = value;
                      },
                    ),
                  ),
                  Container(
                    width: 100,
                    child: Center(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        child: Text('Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        onPressed: loginButtonFun,
                      ),
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: (){
                      msg ='Username: admin , Password: 0000' ;
                      snackBarFun();
                    },
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  RegisterState createState() {
    return RegisterState();
  }
}

class _RegisterData {
  String email = '';
  String password = '';
  String confirmPassword = '';
}

class RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  _RegisterData _data = new _RegisterData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "REGISTER",
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: this._formKey,
            child: new ListView(
              children: <Widget>[
                new TextFormField(
                  decoration: new InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: 'Pleas input your user id',
                      labelText: 'User Id'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "กรุณาระบุ user";
                    }
                  },
                  onSaved: (String value) {
                    this._data.email = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: "Password",
                      hintText: "Pleas input your password"),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "กรุณาระบุ password";
                    }
                  },
                  onSaved: (String value) {
                    this._data.password = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: "Confirm Password",
                      hintText: "Pleas input your password"),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "กรุณาระบุ password";
                    }
                  },
                  onSaved: (String value) {
                    this._data.confirmPassword = value;
                  },
                ),
                new Container(
                  child: new RaisedButton(
                    child: new Text(
                      'CONTINUE',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _formKey.currentState.save();
                      // First validate form.
                      if (this._formKey.currentState.validate()) {
                        if (this._data.email == "admin") {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              // return object of type Dialog
                              return AlertDialog(
                                title: new Text("user นี้มีอยู่ในระบบแล้ว"),
                                actions: <Widget>[
                                  // usually buttons at the bottom of the dialog
                                  new FlatButton(
                                    child: new Text("Close"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                          
                        } else if (this._data.password !=
                            this._data.confirmPassword) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              // return object of type Dialog
                              return AlertDialog(
                                title: new Text("password ไม่ตรงกัน"),
                                actions: <Widget>[
                                  // usually buttons at the bottom of the dialog
                                  new FlatButton(
                                    child: new Text("Close"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          Navigator.pop(context, "/");
                        }
                      }
                    },
                    color: Colors.lightBlue,
                  ),
                  margin: new EdgeInsets.only(top: 20.0),
                ),
              ],
            ),
          )),
    );
  }
}

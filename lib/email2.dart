import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proje/name.dart';
import 'package:toggle_switch/toggle_switch.dart';

bool obscure=true;
bool obscure2=true;

TextEditingController t1= TextEditingController();
TextEditingController t2= TextEditingController();
TextEditingController t3= TextEditingController();
TextEditingController t4= TextEditingController();
TextEditingController t5= TextEditingController();

class Email2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Pro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _controller = false;
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {

    final macroCharts = Center(
      child: Column(
        children: [
          Column(
            children: [
              Container(
                child: Text("Email",),
                alignment: Alignment.centerLeft,
              ),
              TextFormField(
                controller: t1,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                cursorColor: Colors.red,
                onChanged: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),

          Column(
            children: [
              SizedBox(height: 30,),
              Container(
                child: Text("Create Password"),
                alignment: Alignment.centerLeft,
              ),
              TextFormField(
                controller: t2,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                obscureText: obscure,
                cursorColor: Colors.red,
                onChanged: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      obscure=!obscure;
                    });
                  },
                      icon: Icon(CupertinoIcons.eye)),
                ),
              ),
            ],
          ),
          //SizedBox(height: 30,),
          Column(
            children: [
              SizedBox(height: 30,),
              Container(
                child: Text("Re-write Password"),
                alignment: Alignment.centerLeft,
              ),
              TextFormField(
                controller: t3,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                obscureText: obscure2,
                cursorColor: Colors.red,
                onChanged: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      obscure2=!obscure2;
                    });
                  },
                      icon: Icon(CupertinoIcons.eye)),
                ),
              ),
            ],
          ),
          Text("Curabitur lobortis id lorem id bibendum. Ut id consectetur magna. Terms of Use augue enim, pulvinar Privacy Notice lacinia at."),
          ElevatedButton(onPressed: (){
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => Name()),
            );
          },
            child: Text("Continue"),
            style: ElevatedButton.styleFrom(
              primary: Colors.grey[700],
              minimumSize: Size(250, 40),
            ),
          ),
        ],
      ),
    );

    final microCharts = Center(
      child: Column(
        children: [
          Column(
            children: [
              Container(
                child: Text("Email",),
                alignment: Alignment.centerLeft,
              ),
              TextFormField(
                controller: t4,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                cursorColor: Colors.red,
                onChanged: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 30,),
              Container(
                child: Text("Password"),
                alignment: Alignment.centerLeft,
              ),
              TextFormField(
                controller: t5,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                obscureText: obscure,
                cursorColor: Colors.red,
                onChanged: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      obscure=!obscure;
                    });
                  },
                      icon: Icon(CupertinoIcons.eye)),
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: (){},
            child: Text("Forgot Password?"),
          ),
          ElevatedButton(onPressed: (){},
            child: Text("Continue"),
            style: ElevatedButton.styleFrom(
              primary: Colors.grey[700],
              minimumSize: Size(250, 40),
            ),
          ),
        ],
      ),
    );

    final switchPage = Container(
      alignment: Alignment.center,
      child: ToggleSwitch(
        cornerRadius: 20,
        minWidth: 180,
        minHeight: 100,
        fontSize: 20.0,
        initialLabelIndex: _controller ? 1 : 0,
        activeFgColor: Colors.black,
        inactiveBgColor: Colors.grey,
        inactiveFgColor: Colors.white,
        labels: ['Sign up', 'Sign in'],
        onToggle: (index) {
          setState(() {
            _controller = !_controller;
          });
        },
      ),
    );

    var swapTile = new Container(
      child: _controller ? microCharts : macroCharts,
    );

    final body = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 6,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: switchPage,
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.transparent,
                      child: Container(
                        child: _controller ? microCharts : macroCharts,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    final mainBody = Container(
      margin: EdgeInsets.only(
        top: 16.0,
      ),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        top: 12.0,
      ),

      child: Column(
        children: <Widget>[
          // SizedBox(height: 32.0),
          Expanded(
            flex: 11,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: body,
            ),
          ),
          // lorem,
        ],
      ),
    );

    return Scaffold(
      body: mainBody,
    );
  }
}
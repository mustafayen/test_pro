import 'package:flutter/material.dart';
import 'package:proje/registerPage3.dart';

TextEditingController t6= TextEditingController();

class Name extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: const [
                SizedBox(height: 100,),
                Text("Your Name",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50,),
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
            children: [
              SizedBox(height: 200,),
              const Text("Your Name",
                textAlign: TextAlign.left,
              ),
              TextFormField(
                controller: t6,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                cursorColor: Colors.red,
                onChanged: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 100,),
            ],
          ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => Onboarding()),
              );
            },
              child: Text("Continue"),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[700],
                minimumSize: Size(250, 40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

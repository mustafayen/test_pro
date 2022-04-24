import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proje/email2.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Pro',
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("proje"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Logo"),
            SizedBox(height: 50,),
            Text("Description of text pro"),
            SizedBox(height: 50,),
            TextButton(
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Email2()),
                );
              },
              child: Text("Continue with e-mail"),
            ),
            SizedBox(height: 50,),
            TextButton(
              onPressed: (){},
              child: Text("Continue without signing up"),
            ),
          ],
        ),
      ),
    );
  }
}

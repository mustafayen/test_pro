import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:proje/main.dart';
import 'email2.dart';
import 'name.dart';


class Onboarding extends StatefulWidget {
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {

  Future <void> kayitOl() async {
    if(t2.text==t3.text && t1.text.isNotEmpty && t2.text.isNotEmpty) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: t1.text, password: t2.text)
          .then((kullanici) async {
        FirebaseFirestore.instance.collection("Users")
            .doc(t6.text)
            .set({
          "Email": t1.text,
          "Name": t6.text,
          "Gender": cinsiyet,
          "Age": yas,
          "Height": boy,
          "Weight": kilo,
        });
      });
      Navigator.push(context,
        MaterialPageRoute(builder: (context) => LandingPage()),
      );
    }
  }


  Widget customRadio(int index, Icon icon, String gender){
    return ElevatedButton(
      onPressed: (){
        setState(() {
          selected=index;
          cinsiyet=gender;
        });
      },
      child: icon,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(150, 150),
        primary: (selected==index) ? Colors.red[800] : Colors.red[100],
      ),
    );
  }

  String? yas;
  String? boy;
  String? kilo;
  int selected=0;
  String? cinsiyet;

  final age=[
    "0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50",
    "51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100",
  ];

  final height=[
    "0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50",
    "51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100",
    "100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","122","123","124","125","126","127","128","129","130","131","132","133","134","135","136","137","138","139","140","141","142","143","144","145","146","147","148","149","150",
    "151","152","153","154","155","156","157","158","159","160","161","162","163","164","165","166","167","168","169","170","171","172","173","174","175","176","177","178","179","180","181","182","183","184","185","186","187","188","189","190","191","192","193","194","195","196","197","198","199","200",
    "201","202","203","204","205","206","207","208","209","210","211","212","213","214","215","216","217","218","219","220",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        done: ElevatedButton(
          onPressed: null,
          child: Text("Next"),
        ),
        onDone: (){
          kayitOl();
        },
        next: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.grey[700],
          ),
          onPressed: null,
          child: Text("Next"),
        ),
        pages: [
          PageViewModel(
            title: "What is your gender ?",
            bodyWidget: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 300,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      customRadio(1, Icon(Icons.female), "Female"),
                      SizedBox(width: 30,),
                      customRadio(2, Icon(Icons.male), "Male"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          PageViewModel(
            title: "How old are you ?",
            bodyWidget: Center(
              child: Column(
                children: [
                  SizedBox(height: 150,),
                  SizedBox(
                    height: 350,
                    child: CupertinoPicker(
                      itemExtent: 64,
                      children: age.map((e) => Center(
                        child: Text(e,
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                      )).toList(),
                      onSelectedItemChanged: (index){
                        setState(() {
                          yas=index.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          PageViewModel(
            title: "How much is your length ?",
            bodyWidget: Center(
              child: Column(
                children: [
                  SizedBox(height: 150,),
                  SizedBox(
                    height: 350,
                    child: CupertinoPicker(
                      itemExtent: 64,
                      children: height.map((f) => Center(
                        child: Text(f,
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                      )).toList(),
                      onSelectedItemChanged: (index){
                        setState(() {
                          boy=index.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          PageViewModel(
            title: "How much is your weight ?",
            bodyWidget: Center(
              child: Column(
                children: [
                  SizedBox(height: 150,),
                  SizedBox(
                    height: 350,
                    child: CupertinoPicker(
                      itemExtent: 64,
                      children: height.map((g) => Center(
                        child: Text(g,
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                      )).toList(),
                      onSelectedItemChanged: (index){
                        setState(() {
                          kilo=index.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
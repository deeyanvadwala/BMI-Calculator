import 'package:bmi/constant.dart';
import 'package:flutter/material.dart';

class Secondscreen extends StatefulWidget {
  final int bmiresult;
  const Secondscreen({super.key, required this.bmiresult});

  @override
  State<Secondscreen> createState() => _SecondscreenState();
}

class _SecondscreenState extends State<Secondscreen> {
  var bmicolor = Colors.blueGrey;
  var bmitext = 'Normal';
  var imagepath = 'normal';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI();
  }

  void updateUI(){
    var bmi = widget.bmiresult;
    if(bmi<=18){
      setState(() {
         bmicolor = Colors.blueGrey;
         bmitext = 'Under Weight';
         imagepath = 'underweight';
      });

    }
    else if (bmi>18 && bmi<=25){
      setState(() {
         bmicolor = Colors.green;
         bmitext = 'Normal';
         imagepath = 'normal';
      });

    }
    else if (bmi>25 && bmi<=30){
      setState(() {
         bmicolor = Colors.yellow;
         bmitext = 'Over Weight';
         imagepath = 'overweight';
      });

    }
    else if (bmi>30 && bmi<40){
      setState(() {
         bmicolor = Colors.orange;
         bmitext = 'Obesity';
         imagepath = 'obese';
      });

    }
    else {
      setState(() {
         bmicolor = Colors.red;
         bmitext = 'Severe Obesity';
         imagepath = 'extreme';
      });

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI Result',style: TextStyle(color: Colors.white)),
        elevation: 2,
        backgroundColor: darkBlueColour,
        iconTheme: IconThemeData(color: Colors.white)
      ),
      backgroundColor: darkBlueColour,
      body: Column(
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
           decoration: BoxDecoration(
            color: blueColor,
            borderRadius: BorderRadius.circular(8)
           ),
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Your BMI value is : ',style: TextStyle(color: Colors.blueGrey, fontSize: 30, fontWeight: FontWeight.bold)),
                Text('${widget.bmiresult}',style: numtextStyle),
                Text('${bmitext}',style: TextStyle(color: bmicolor, fontSize: 30, fontWeight: FontWeight.bold)),
                ],
            ),
          ),
          Image.asset('images/${imagepath}.png'),
           GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                         color: Colors.pink,
                         borderRadius: BorderRadius.circular(10)
                     ),
                     child: Padding(
                       padding: const EdgeInsets.only(top: 2.0),
                       child: Text('Calculate Again',style: textStyle, textAlign: TextAlign.center)
                     )),
            ),
        ],
      ),
    );
  }
}
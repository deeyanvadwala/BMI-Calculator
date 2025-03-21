import 'package:bmi/constant.dart';
import 'package:bmi/secondscreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int heightslider=120;
  int agebutton=23;
  int weightbutton=45;
  Color maleColour = Color(0xff033e66);
  Color femaleColour = Color(0xff033e66);

  void calculatebmi(){
    var height = heightslider/100;
    var bmi = weightbutton/(height*height);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Secondscreen(bmiresult: bmi.round())));
  }

  void selectgender(bool gender){
    if(gender){
      setState(() {
        maleColour = blueColor;
      femaleColour = selectedColor;
      });
      

    }
    else{
      setState(() {
        maleColour = selectedColor;
      femaleColour =blueColor ;
      });
    }

  }
void addsubage(bool addsubage){
    if(addsubage){
      setState(() {
        agebutton+=1;
      });
    }
    else{
      setState(() {
       agebutton-=1;
      });
    }
  }
  void addsubweight(bool addsubweight){
    if(addsubweight){
      setState(() {
        weightbutton+=1;
      });
    }
    else{
      setState(() {
       weightbutton-=1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI Calculator',style: TextStyle(color: Colors.white)),
        elevation: 2,
        backgroundColor: darkBlueColour,
      ),
      backgroundColor: darkBlueColour,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectgender(true);
                        });
                        
                      },
                      child: reusecontainer(Colour: maleColour, cardChild: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: FaIcon(FontAwesomeIcons.mars,size: 80,color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("Male",style: textStyle),
                          ),
                        ],
                      )),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectgender(false);
                        });
                        
                      },
                      child: reusecontainer(Colour: femaleColour,cardChild: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: FaIcon(FontAwesomeIcons.venus,size: 80,color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Female',style:textStyle),
                          ),
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: reusecontainer(Colour: blueColor,cardChild: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Height',style: textStyle),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${heightslider}",style: numtextStyle),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('cm',style: numtextStyle),
                            ),
                          ],
                        ),
                        Slider(
                          min: 120,
                          max: 200,
                          thumbColor: Colors.blue,
                          activeColor: Colors.blue,
                          inactiveColor: Colors.blue.shade100,
                          value: heightslider.toDouble(), 
                          onChanged: (double value){
                            setState(() {
                              heightslider = value.toInt();
                            });
                          })
                

                      ],
                    )),
                  ),],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: reusecontainer(Colour: blueColor,cardChild: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Age',style: textStyle),
                        ),
                        Text("${agebutton}",style: numtextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Roundbutton(
                                onPressed: (){
                                  setState(() {
                                    addsubage(true);
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Roundbutton(
                                onPressed: (){
                                  setState(() {
                                    addsubage(false);
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                            )
                          ],
                        )
                      ],
                    )),
                  ),
                  Expanded(
                    child: reusecontainer(Colour: blueColor,cardChild: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Weight',style: textStyle),
                        ),
                        Text("${weightbutton}",style: numtextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Roundbutton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    addsubweight(true);
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Roundbutton(
                                onPressed: (){
                                  setState(() {
                                    addsubweight(false);
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                            )
                          ],
                        )
                        
                      ],
                    )),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                calculatebmi();
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
                       child: Text('Calculate BMI',style: textStyle, textAlign: TextAlign.center)
                     )),
            ),
            
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class reusecontainer extends StatelessWidget {
   reusecontainer({
    required this.Colour, required  this.cardChild,
  });

  // ignore: non_constant_identifier_names
  Color Colour;
  final Widget cardChild;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
         color: Colour,
         borderRadius: BorderRadius.circular(10)
    
      ),
     child: cardChild,
      margin: EdgeInsets.all(10),
      height: 200,
      width: 200,
    );
  }
}

class Roundbutton extends StatelessWidget {
  const Roundbutton({super.key, required this.icon, required this.onPressed});
final IconData icon;
final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon, color: Colors.white),
      elevation: 6,
      constraints: BoxConstraints(minHeight:56.0 ,minWidth:56.0),
      shape: CircleBorder(),
      fillColor: selectedColour,
    );
  }
}
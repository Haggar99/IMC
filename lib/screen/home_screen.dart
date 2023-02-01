import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imc/components/reusable_card.dart';
import 'package:imc/components/card_button.dart';
import 'package:imc/components/roud_icon_button.dart';
import 'package:imc/constant.dart';
import 'package:imc/screen/result_screen.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool homme = true;
  bool femme = false;
  int poid = 50;
  int age = 21;
  int taille = 160;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculateur de IMC'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    widgetCard: CardButton(
                      icon: FontAwesomeIcons.mars,
                      label: 'Homme',
                    ),
                    onPress: () => setState(() {
                          homme = true;
                          femme = false;
                        }),
                    color: homme ? Colors.blueGrey.shade200 : Colors.blueGrey,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    widgetCard: CardButton(
                      icon: FontAwesomeIcons.venus,
                      label: 'Femme',
                    ),
                    onPress: () {
                      setState(() {
                        femme = true;
                        homme = false;
                      });
                    },
                    color: femme ? Colors.blueGrey.shade200 : Colors.blueGrey,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              widgetCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Taille', style: kTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('$taille', style: kNumberStyle,),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text('cm', style: TextStyle(
                        fontSize: 16.0,
                      ),),
                    ],
                  ),
                  Slider(
                    value: taille.toDouble(),
                    max: 230,
                    min: 100,
                    onChanged: (double value){
                      setState(() {
                        taille = value.toInt();
                      });
                    },
                  )
                ],
              ),
              color: Colors.blueGrey,
              onPress: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    widgetCard: Column(
                      children: [
                        Text('Poid', style: kTextStyle,),
                        Text('$poid', style: kNumberStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  poid--;
                                  if(poid == 0){
                                    poid = 0;
                                  }
                                });
                              },
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    poid++;
                                  });
                                }
                            )
                          ],
                        )
                      ],
                    ),
                    color: Colors.blueGrey,
                    onPress: () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    widgetCard: Column(
                      children: [
                        Text('Age', style: kTextStyle,),
                        Text('$age', style: kNumberStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age--;
                                  if(age < 5) {
                                    age = 6;
                                  }
                                });
                              },
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                }
                            )
                          ],
                        )
                      ],
                    ),
                    color: Colors.blueGrey,
                    onPress: () {},
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: TextButton(
        child: Text('CALCULER VOTRE IMC', style: TextStyle(
          fontSize: 18.0,
          color: Colors.white
        ),),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green),
          padding: MaterialStateProperty.all(EdgeInsets.all(30.0))
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(
                taille: taille,
                poid: poid
              )
            )
          );
        },
      ),
    );
  }
}

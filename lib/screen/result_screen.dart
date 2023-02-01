import 'dart:math';

import 'package:flutter/material.dart';
import 'package:imc/components/reusable_card.dart';


class ResultScreen extends StatefulWidget {
   ResultScreen({
    required this.taille,
    required this.poid,
    Key? key}) : super(key: key);

  final int taille;
  final int poid;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  double imc = 0.0;

   calculerIMC() {
    imc = widget.poid / pow((widget.taille/100), 2);
    imc.toStringAsFixed(1);
  }
  String getResultat() {
     if(imc < 18.4) {
       return 'Maigre';
     }
     else if(imc > 18.5 && imc < 24.9) {
       return 'Normal';
     }
     else if(imc > 25 && imc < 29.9) {
       return 'Surpoids';
     }
     else if(imc > 30 && imc < 34.9) {
       return 'Obésité modérée';
     }
     else if(imc > 35 && imc < 39.9) {
       return 'Obésité sévère';
    }else {
       return 'Obésité morbide';
     }
  }


  @override
  void initState() {
    calculerIMC();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("le poid : ${widget.poid}");
    print("la taille : ${widget.taille}");
    print('imc : ${imc.toStringAsFixed(1)}');
    print('Votre etat: ${getResultat()}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultat'),
        centerTitle: true,
      ),
      body: Container(
        child: ReusableCard(
          onPress: (){},
          color: Colors.blueGrey,
          widgetCard: Text(
            'Votre etat : ${getResultat()}',
            style: TextStyle(
              fontSize: 24.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),

      bottomNavigationBar: TextButton(
        child: Text('RE-CALCULER VOTRE IMC', style: TextStyle(
            fontSize: 18.0,
            color: Colors.white
        ),),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
            padding: MaterialStateProperty.all(EdgeInsets.all(30.0))
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

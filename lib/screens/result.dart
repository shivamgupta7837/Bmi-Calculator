import 'package:bmi_calculator/screens/choose_gender.dart';
import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  BmiResult({super.key, required this.height, required this.weight});
  var height = TextEditingController();
  var weight = TextEditingController();

  @override
  Widget build(BuildContext context) {
     calculateBmi() {
      final height = this.height;
      final weight = this.weight;
      final result = double.parse(weight.text) /
          (double.parse(height.text) *
          double.parse(height.text));
       return result.round();
    }

    var result = calculateBmi();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
        Container(
          padding: const EdgeInsets.only(top: 25),
          margin: const EdgeInsets.only(left: 15, top: 55),
          height: MediaQuery.of(context).size.height * 0.28,
            width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(3.0, 5.9),
                  blurRadius: 8.0,
                  spreadRadius: 7)
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Your Health",
                style: TextStyle(
                  color: Colors.black,
                    fontSize: 34,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
              ),
             const  SizedBox(height: 18),
              Text(
                result.toString(),
                style: const TextStyle(
                  color: Colors.black,
                    fontSize: 80,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
               SizedBox(height: MediaQuery.of(context).size.height * 0.12),
              Text(
                "BMI = $result Kg/m^2",
                style:   TextStyle(
                  color: Colors.blue[900],
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
              ),
            const  SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left:35.0),
                child: Text(
                  bmi(result.toDouble()),
                  textAlign: TextAlign.center,
                  style:   TextStyle(
                    color: Colors.blue[700],
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic),
                ),
              ),
             const SizedBox(height: 30),
             CircleAvatar(
              maxRadius: 25,
               child: Center(
                 child: IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseGender()));
                 }, icon: const Icon(Icons.restart_alt_rounded,size: 28,)),
               ),
             )
      ]),
    );
  }
  
  String bmi(var result) {
    if(result < 18.5){
      return "You are under weight Normal BMI weight range \n between 18.5 - 24.9";
    }else if(result == 18.5 || result <24.9 || result ==24.9){
      return "Your BMI is normal";
    }else if(result == 24.9 || result<29.9){
      return "You are over weight Normal BMI weight range \n betwee 18.5 - 24.9";
    }else if(result > 30){
      return "Obesity \n Normal BMI weight range between 18.5 - 24.9";
    }
    return "Something went wrong";
  }
}

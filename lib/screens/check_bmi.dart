import 'package:bmi_calculator/screens/convertor.dart';
import 'package:bmi_calculator/screens/result.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CheckBmi extends StatefulWidget {
  String? maleAvatar;
  String? femaleAvatar;
  String? otherAvatar;
  bool? isMale;
  bool? isFemale;
  bool? isOther;
  CheckBmi(
      {this.maleAvatar,
      this.femaleAvatar,
      this.otherAvatar,
      this.isMale,
      this.isFemale,
      this.isOther});

  @override
  State<CheckBmi> createState() => _CheckBmiState();
}

class _CheckBmiState extends State<CheckBmi> {
  final _formKey = GlobalKey<FormState>();

  final heightController = TextEditingController();
  final weightController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Bmi Calculator",
          style: TextStyle(
              color: Colors.black, fontStyle: FontStyle.italic, fontSize: 24),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                // height: isOther==false ? 200 : MediaQuery.of(context).size.height * 0.3,
                height: MediaQuery.of(context).size.height * 0.35,
                margin: EdgeInsets.only(bottom: 20),
                child: checkMaleOrFeamle(),
              ),
              const SizedBox(height: 8),
              const Text(
                "Enter Your Details",
                style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontSize: 24),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Height";
                    }
                  },
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: "Enter your height in meters",
                      border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your weight ";
                    }
                  },
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: "Enter your weight in Kg",
                      border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.88,
                height: MediaQuery.of(context).size.height * 0.06,
                child: ElevatedButton(
                  onPressed: () {
                    TextEditingController height = heightController;
                    TextEditingController weight = weightController;
                    final isFormValid = _formKey.currentState!.validate();
                    if (isFormValid) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  BmiResult(height: height, weight: weight)));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 8),
                  child: const Text(
                    "Check your BMI",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
               SizedBox(height:MediaQuery.of(context).size.height * 0.1),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: GestureDetector(
                  child: const Text("Don't know your height in meters ?",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,fontWeight: FontWeight.w500),),
                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => Convertor(),)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  dynamic checkMaleOrFeamle() {
    if (widget.isMale == true) {
      return Lottie.asset(widget.maleAvatar!);
    } else if (widget.isFemale == true) {
      return Lottie.asset(widget.femaleAvatar!);
    }
    return Image.asset(widget.otherAvatar!);
  }
}
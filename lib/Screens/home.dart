import 'package:flutter/material.dart';
import 'package:project_bmi/constant/App_constant.dart';
import 'package:project_bmi/widgets/leftbar.dart';
import 'package:project_bmi/widgets/rightbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiresult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            color: accentHexColor,
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _heightController,
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor,
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Height",
                          hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _weightController,
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor,
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Weight",
                          hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: (() {
                  double _h=double.parse(_heightController.text);
                  double _w=double.parse(_weightController.text);
                  setState(() {
                    _bmiresult=_w / ( _h * _h );
                    if( _bmiresult > 25 ){
                      _textResult="You\'re Over Weight";
                    }
                    else if( _bmiresult >= 18.5 && _bmiresult <= 25 ){
                      _textResult="You have Normal Weight";
                    }
                    else {
                      _textResult="You\'re Under Weight";
                    }
                  });

                }),
                child: Container(
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Text(
                  _bmiresult.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 90,
                    fontWeight: FontWeight.w200,
                    color: accentHexColor,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Visibility(
                visible: _textResult.isNotEmpty,
                child: Container(
                  child: Text(
                    _textResult,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: accentHexColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RightBar(barWidth: 40),
              SizedBox(
                height: 20,
              ),
              RightBar(barWidth: 40),
              SizedBox(
                height: 10,
              ),
              LeftBar(barWidth: 40),
              SizedBox(
                height: 10,
              ),
              LeftBar(barWidth: 70),
              SizedBox(
                height: 10,
              ),
              LeftBar(barWidth: 30),
            ],
          ),
        ),
      ),
    );
  }
}

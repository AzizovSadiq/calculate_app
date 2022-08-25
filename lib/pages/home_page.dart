import 'package:flutter/material.dart';

import '../widgets/custom_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double firstNumber = 0.0;
  double secondNumber = 0.0;
  String value = ''; // elave
  String text = '';
  String result = '';
  String operation = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: MyPadd.sHorizontal20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                textWidgetBtn(value, Colors.white, 35, FontWeight.normal),
              ],
            ),
            MyHeightBox.sHeight10,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                textWidgetBtn(text, Colors.white, 45, FontWeight.bold),
              ],
            ),
            MyHeightBox.sHeight10,
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    button('AC', Colors.amber, Colors.black, true),
                    button('C', Colors.red, Colors.white, true),
                    button('%', Color.fromARGB(255, 94, 92, 92), Colors.white,
                        true),
                    button('/', Colors.amber, Colors.white, true),
                  ],
                ),
                MyHeightBox.sHeight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    button('7', Color.fromARGB(255, 94, 92, 92), Colors.white,
                        true),
                    button('8', Color.fromARGB(255, 94, 92, 92), Colors.white,
                        true),
                    button('9', Color.fromARGB(255, 94, 92, 92), Colors.white,
                        true),
                    button('x', Colors.amber, Colors.white, true),
                  ],
                ),
                MyHeightBox.sHeight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    button('4', Color.fromARGB(255, 94, 92, 92), Colors.white,
                        true),
                    button('5', Color.fromARGB(255, 94, 92, 92), Colors.white,
                        true),
                    button('6', Color.fromARGB(255, 94, 92, 92), Colors.white,
                        true),
                    button('-', Colors.amber, Colors.white, true),
                  ],
                ),
                MyHeightBox.sHeight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    button('1', Color.fromARGB(255, 94, 92, 92), Colors.white,
                        true),
                    button('2', Color.fromARGB(255, 94, 92, 92), Colors.white,
                        true),
                    button('3', Color.fromARGB(255, 94, 92, 92), Colors.white,
                        true),
                    button('+', Colors.amber, Colors.white, true),
                  ],
                ),
                MyHeightBox.sHeight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    button('0', Color.fromARGB(255, 94, 92, 92), Colors.white,
                        false),
                    button('.', Color.fromARGB(255, 94, 92, 92), Colors.white,
                        true),
                    button('=', Colors.amber, Colors.white, true),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget button(
      String btnText, Color btnColor, Color textColor, bool isCircler) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: btnColor,
        shape: isCircler ? const CircleBorder() : const StadiumBorder(),
        fixedSize: isCircler ? const Size(70.0, 70.0) : const Size(160.0, 70.0),
      ),
      onPressed: () => calculate(btnText),
      child: Center(
        child: Text(
          btnText,
          style: TextStyle(
            fontSize: 25,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void calculate(String btnText) {
    if (btnText == 'AC' ) {
      result = '0';
      text = '0';
      value = '0';
      firstNumber = 0.0;
      secondNumber = 0.0;
    } else if(btnText == 'C'){
        result = '-------';//hele fikirlesirem)))
    }else if (btnText == '+' ||
        btnText == '-' ||
        btnText == '/' ||
        btnText == 'x' ||
        btnText == '%' 
        // btnText == 'C'
        ) {
      firstNumber = double.parse(text);
      value = firstNumber.toString();
      result = '';
      operation = btnText;
    } else if (btnText == '=') {
     
      secondNumber = double.parse(text);
       value =
          '${firstNumber.toString() + operation.toString() + secondNumber.toString()}';
      //  if (operation == 'C') {
      //   result = 'Get Tullan)))';
      //     // text = (text.lenght - 1).toString();
      //     // firstNumber -= firstNumber;
      //  }
      if (operation == '+') {
        result = (firstNumber + secondNumber).toString();
       
      }
      if (operation == '-') {
        result = (firstNumber - secondNumber).toString();
      }
      if (operation == '/') {
        result = (firstNumber / secondNumber).toString();
      }
      if (operation == 'x') {
        result = (firstNumber * secondNumber).toString();
      }
      if (operation == '%') {
        result = ((firstNumber / 100) * secondNumber).toString();
      }
    } else {
      result = int.parse(text + btnText).toString();
    }
    setState(() {
      text = result;
    });
  }
}

class MyPadd {
  static const EdgeInsets sHorizontal10 =
      EdgeInsets.symmetric(horizontal: 10.0);
  static const EdgeInsets sHorizontal20 =
      EdgeInsets.symmetric(horizontal: 20.0);
  static const EdgeInsets sVertical10 = EdgeInsets.symmetric(vertical: 10.0);
  static const EdgeInsets sVertical20 = EdgeInsets.symmetric(vertical: 20.0);
}

class MyHeightBox {
  static const SizedBox sHeight20 = SizedBox(height: 20.0);
  static const SizedBox sHeight10 = SizedBox(height: 10.0);
}

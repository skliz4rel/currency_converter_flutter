import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    if (kDebugMode) debugPrint("Button clicked ");

    setState(() {
      result = (double.parse(textEditingController.text) * 81);

      debugPrint("result is ${result}");
    });
  }

  //this is executed before the build state is created
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    debugPrint(
      "init state",
    ); //so you can do async calls that would execute before the build function creates the views when state is manipulted or updated
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();

    super.dispose(); //This most always be the last statement you call
  }

  //Build function must not contain async code. cos it can be called multiple times.
  //Keep it light has possible. No expensive objects must be created here.
  @override
  Widget build(BuildContext context) {
    debugPrint("rebuild");

    var border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2.0,
        style: BorderStyle.solid,
        //strokeAlign: BorderStyle(strokeAlign:Bor),
      ),
      borderRadius: BorderRadius.circular(15),
    );

    const space = SizedBox(height: 20);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Conrrency Converter"),
        shadowColor: Colors.amber,
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.black,
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              child: Text(
                "NGN ${(result != 0) ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),

            space,

            Container(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Enter amount in USD",
                  // errorText: "Error when entering the USD ",
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed:
                    convert, //This is a way to reference the function to perfrom the action
                style: ElevatedButton.styleFrom(
                  elevation: 15,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text('Convert'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

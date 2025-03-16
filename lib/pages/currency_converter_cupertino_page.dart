import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//This is for IOS devices

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CurrencyConverterCupertinoPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    if (kDebugMode) debugPrint("Button clicked ");

    setState(() {
      result = (double.parse(textEditingController.text) * 81);

      debugPrint("result is ${result}");
    });
  }

  @override
  void initState() {
    super.initState(); //This should always be the first statement on this line

    // TODO: implement initState below
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();

    super.dispose(); //This most always be the last statement you call
  }

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

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey3,
        middle: Text("Conrrency Converter"),
        // shadowColor: Colors.amber,
      ),
      backgroundColor: CupertinoColors.systemGrey3,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: CupertinoColors.black,
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
              child: CupertinoTextField(
                controller: textEditingController,
                style: const TextStyle(color: CupertinoColors.black),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                  color: CupertinoColors.white,
                ),
                placeholder: 'Enter an amoutn',
                prefix: const Icon(CupertinoIcons.money_dollar),
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoButton(
                color: CupertinoColors.black,
                onPressed:
                    convert, //This is a way to reference the function to perfrom the action

                child: const Text('Convert'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

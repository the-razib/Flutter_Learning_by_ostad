import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Here we add two text editing controller for TextField data
  final TextEditingController _firstNumTEController = TextEditingController();
  final TextEditingController _secondNumTEController = TextEditingController();
  final GlobalKey<FormState> _formkey =GlobalKey<FormState>();
  double _result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              // First number Input TextField
              TextFormField(
                controller: _firstNumTEController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'First Number', labelText: 'First Number'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter a value';
                  }
                  return null;
                },
              ),
              // Second number Input TextField
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: _secondNumTEController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'Second Number', labelText: 'Second Number'),

                // input validation
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return 'Enter a value';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 24,
              ),

              // here we call the method build Button
              _buildButton(),
              /* ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  // add button
                  IconButton(onPressed: _onTabAddButton, icon: Icon(Icons.add)),
                  // subtract button
                  IconButton(onPressed: _onTabSubButton, icon: Icon(Icons.remove)),
                  TextButton(
                      onPressed: _onTabDivisionButton,
                      child: Text(
                        '/',
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      )),
                  // multiplication
                  TextButton(
                      onPressed: _onTabMultiButton,
                      child: Text(
                        '*',
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      )),
                ],
              ), */
              const SizedBox(
                height: 24,
              ),
              // we can use shortcut Alt + Ctrl for method extraction
              buildText()
            ],
          ),
        ),
      ),
    );
  }

  // method extraction
  Text buildText() {
    return Text(
      'Result: ${_result.toStringAsFixed(2)}',
      style: const TextStyle(fontSize: 18),
    );
  }

  // Method extraction  here we create a method it return widget
  Widget _buildButton() {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        // add button
        IconButton(onPressed: _onTabAddButton, icon: Icon(Icons.add)),
        // subtract button
        IconButton(onPressed: _onTabSubButton, icon: Icon(Icons.remove)),
        TextButton(
            onPressed: _onTabDivisionButton,
            child: Text(
              '/',
              style: TextStyle(fontSize: 24, color: Colors.black),
            )),
        // multiplication
        TextButton(
            onPressed: _onTabMultiButton,
            child: Text(
              '*',
              style: TextStyle(fontSize: 24, color: Colors.black),
            )),
      ],
    );
  }

  void _onTabAddButton() {
    // form validation
    // if (_validateTextsFields() == false) {
    //   return;
    // }

    // form validation second method
    if(_formkey.currentState!.validate()){
    double firstNumber = double.tryParse(_firstNumTEController.text) ?? 0;
    double secondNumber = double.tryParse(_secondNumTEController.text) ?? 0;
    _result = firstNumber + secondNumber;
    setState(() {});
  }
  }

  void _onTabSubButton() {
    if(_formkey.currentState!.validate() == false){
      return;
    }
    double firstNumber = double.tryParse(_firstNumTEController.text) ?? 0;
    double secondNumber = double.tryParse(_secondNumTEController.text) ?? 0;

    _result = firstNumber - secondNumber;
    setState(() {});
  }

  void _onTabDivisionButton() {
    if(_formkey.currentState!.validate() == false){
      return;
    }
    double firstNumber = double.tryParse(_firstNumTEController.text) ?? 0;
    double secondNumber = double.tryParse(_secondNumTEController.text) ?? 0;

    _result = firstNumber / secondNumber;
    setState(() {});
  }

  void _onTabMultiButton() {
    if(_formkey.currentState!.validate() == false){
      return;
    }
    double firstNumber = double.tryParse(_firstNumTEController.text) ?? 0;
    double secondNumber = double.tryParse(_secondNumTEController.text) ?? 0;

    _result = firstNumber * secondNumber;
    setState(() {});
  }

  // check input validation
  bool _validateTextsFields() {
    if (_firstNumTEController.text.isEmpty) {
      return false;
    }
    if (_secondNumTEController.text.isEmpty) {
      return false;
    }
    return true;
  }

  //
@override
  void dispose() {
    // TODO: implement dispose
  _firstNumTEController.dispose();
  _secondNumTEController.dispose();
    super.dispose();
  }
}


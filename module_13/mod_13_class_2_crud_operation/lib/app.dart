import 'package:flutter/material.dart';
import 'package:mod_13_class_2_crud_operation/screens/product_list.dart';

class CrudApp extends StatelessWidget {
  const CrudApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 5),
            borderRadius: BorderRadius.circular(16),
          ),
        ),

      ),
      home: ProductListScreen(),
    );
  }
}

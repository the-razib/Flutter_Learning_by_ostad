import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mod_13_class_2_crud_operation/models/product.dart';
import 'package:mod_13_class_2_crud_operation/screens/add_new_product_screen.dart';
import 'package:mod_13_class_2_crud_operation/widgets/product_item.dart';
import 'package:http/http.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> productList = [];
  bool _inprogress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green.shade50,
        appBar: AppBar(
          backgroundColor: Colors.green.shade700,
          title: Text('Product List',style: TextStyle(color: Colors.white),),
          actions: [
            IconButton(
                onPressed: () {
                  getProductList();
                },
              iconSize: 36,
                icon: Icon(Icons.refresh),color: Colors.white,)
          ],
        ),
        body: _inprogress ? Center(
          child: CircularProgressIndicator(),
        ): Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.separated(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return ProductItem(
                product: productList[index],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 16,
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return const AddNewProductScreen();
              }),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Future<void> getProductList() async {
    // Set _inprogress to true before starting the request
    _inprogress = true;
    setState(() {});

    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/ReadProduct');
    Response response = await get(uri);

    print(response);
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      // Clear the productList to avoid duplicates on reload
      productList.clear();
      for (var item in jsonResponse['data']) {
        Product product = Product(
          id: item['_id'] ?? '',
          productName: item['ProductName'] ?? 'Unknown',
          productCode: item['ProductCode'] ?? 'N/A',
          productImage: item['Img'] ?? 'https://via.placeholder.com/150',
          unitPrice: item['UnitPrice'] ?? '0',
          quantity: item['Qty'] ?? '0',
          totalPrice: item['TotalPrice'] ?? '0',
          createAt: item['CreatedDate'] ?? '',
        );
        productList.add(product);
      }
    }

    // Set _inprogress to false after the request completes
    _inprogress = false;
    setState(() {
      // Trigger a rebuild after updating the productList
    });
  }

}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mod_13_class_2_crud_operation/models/product.dart';

class UpdateProductScreen extends StatefulWidget {
  final Product product; // Receive the product to update

  const UpdateProductScreen({super.key, required this.product});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final TextEditingController _productNameTEController =
  TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _productImageTEController =
  TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();

  bool _inprogress = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _productNameTEController.text = widget.product.productName;
    _unitPriceTEController.text = widget.product.unitPrice;
    _totalPriceTEController.text = widget.product.totalPrice;
    _productImageTEController.text = widget.product.productImage;
    _codeTEController.text = widget.product.productCode;
    _quantityTEController.text = widget.product.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: Text(
          'Update Product',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildUpdateProductForm(),
        ),
      ),
    );
  }

  Widget _buildUpdateProductForm() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          _buildTextField(
            controller: _productNameTEController,
            label: 'Product Name',
            hint: 'Name',
            validatorMessage: 'Enter Product Name',
          ),
          _buildTextField(
            controller: _unitPriceTEController,
            label: 'Unit Price',
            hint: 'Unit Price',
            validatorMessage: 'Enter Unit Price',
          ),
          _buildTextField(
            controller: _totalPriceTEController,
            label: 'Total Price',
            hint: 'Total Price',
            validatorMessage: 'Enter Total Price',
          ),
          _buildTextField(
            controller: _productImageTEController,
            label: 'Product Image',
            hint: 'Image',
            validatorMessage: 'Enter Product Image',
          ),
          _buildTextField(
            controller: _codeTEController,
            label: 'Product Code',
            hint: 'Product Code',
            validatorMessage: 'Enter Product Code',
          ),
          _buildTextField(
            controller: _quantityTEController,
            label: 'Quantity',
            hint: 'Quantity',
            validatorMessage: 'Enter Product Quantity',
          ),
          SizedBox(height: 16),
          _inprogress
              ? Center(
            child: CircularProgressIndicator(),
          )
              : ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  fixedSize: Size.fromWidth(double.maxFinite)),
              onPressed: _onUpdateProductButtonPressed,
              child: Text(
                'Update Product',
                style: TextStyle(color: Colors.white, fontSize: 24),
              )),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required String validatorMessage,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            labelText: label,
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return validatorMessage;
            }
            return null;
          },
        ),
        SizedBox(height: 16),
      ],
    );
  }

  void _onUpdateProductButtonPressed() {
    if (_formkey.currentState!.validate()) {
      updateProduct();
    }
  }

  Future<void> updateProduct() async {
    setState(() {
      _inprogress = true;
    });

    Uri uri = Uri.parse(
        'http://164.68.107.70:6060/api/v1/UpdateProduct/${widget.product.id}');

    Map<String, dynamic> requestBody = {
      "Img": _productImageTEController.text,
      "ProductCode": _codeTEController.text,
      "ProductName": _productNameTEController.text,
      "Qty": _quantityTEController.text,
      "TotalPrice": _totalPriceTEController.text,
      "UnitPrice": _unitPriceTEController.text,
    };

    try {
      Response response = await post(
        uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Product Updated Successfully'),
          ),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update product: ${response.statusCode} - ${response.body}'),
          ),
        );
      }
    } catch (e) {
      print('An error occurred: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
        ),
      );
    } finally {
      setState(() {
        _inprogress = false;
      });
    }
  }



  @override
  void dispose() {
    _productImageTEController.dispose();
    _productNameTEController.dispose();
    _unitPriceTEController.dispose();
    _totalPriceTEController.dispose();
    _codeTEController.dispose();
    _quantityTEController.dispose();
    super.dispose();
  }
}

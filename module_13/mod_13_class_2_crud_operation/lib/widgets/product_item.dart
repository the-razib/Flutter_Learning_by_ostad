import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mod_13_class_2_crud_operation/models/product.dart';
import 'package:mod_13_class_2_crud_operation/screens/update_product_screen.dart';

class ProductItem extends StatefulWidget {
  final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool _inProgress = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            _buildProductInfo(),
            const Divider(),
            _buildButtonBar(),
            if (_inProgress) const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }

  Widget _buildProductInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProductText(widget.product.productName, fontWeight: FontWeight.bold, fontSize: 18),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.production_quantity_limits, 'Product Code: ${widget.product.productCode}'),
        const SizedBox(height: 4),
        _buildInfoRow(Icons.monetization_on, 'Price: \$${widget.product.unitPrice}'),
        const SizedBox(height: 4),
        _buildInfoRow(Icons.inventory, 'Quantity: ${widget.product.quantity}'),
        const SizedBox(height: 4),
        _buildInfoRow(Icons.calculate, 'Total: \$${widget.product.totalPrice}'),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Colors.black54),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildProductText(String text, {FontWeight fontWeight = FontWeight.normal, double fontSize = 16}) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: Colors.black87,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildButtonBar() {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton.icon(
          onPressed: () => _navigateToUpdateProductScreen(),
          icon: const Icon(Icons.edit, color: Colors.blue),
          label: const Text('Edit', style: TextStyle(color: Colors.blue)),
        ),
        TextButton.icon(
          onPressed: () => _showDeleteConfirmationDialog(),
          icon: const Icon(Icons.delete, color: Colors.red),
          label: const Text('Delete', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }

  void _navigateToUpdateProductScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpdateProductScreen(product: widget.product),
      ),
    );
  }

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this product?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Close the dialog
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _deleteProduct();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteProduct() async {
    setState(() {
      _inProgress = true;
    });

    final uri = Uri.parse('http://164.68.107.70:6060/api/v1/DeleteProduct/${widget.product.id}');
    final response = await http.get(
      uri,
      headers: {"Content-Type": "application/json"},
    );

    setState(() {
      _inProgress = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          response.statusCode == 200
              ? 'Product Deleted Successfully, Press refresh button see updated'
              : 'Failed to delete product: ${response.statusCode} - ${response.body}',
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CartItem {
  String name;
  String color;
  String size;
  int price;
  int quantity;
  String imageUrl;

  CartItem({
    required this.name,
    required this.color,
    required this.size,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });
}

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem(
        name: "Pullover",
        color: "Black",
        size: "L",
        price: 51,
        quantity: 1,
        imageUrl: "assets/pullover.png"),
    CartItem(
        name: "T-Shirt",
        color: "Gray",
        size: "L",
        price: 30,
        quantity: 1,
        imageUrl: "assets/tshirt.png"),
    CartItem(
        name: "Sport Dress",
        color: "Black",
        size: "M",
        price: 43,
        quantity: 1,
        imageUrl: "assets/sportdress.png"),
  ];

  int get totalAmount {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  void incrementQuantity(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void decrementQuantity(int index) {
    setState(() {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      }
    });
  }

  void showCheckoutSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Congratulations! Your order has been placed.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bag'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(cartItems[index].imageUrl,
                              width: 100, height: 120),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(cartItems[index].name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    IconButton(
                                      icon: Icon(Icons.more_vert),
                                      onPressed: () {
                                        // Handle 3-dot menu action here
                                      },
                                    ),
                                  ],
                                ),
                                Text(
                                    'Color: ${cartItems[index].color}, Size: ${cartItems[index].size}'),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            // Background color
                                            shape: BoxShape
                                                .circle, // Circular shape
                                          ),
                                          child: IconButton(
                                            icon: Icon(Icons.remove),
                                            onPressed: () =>
                                                decrementQuantity(index),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Text(cartItems[index]
                                            .quantity
                                            .toString(),style: TextStyle(fontSize: 16),),
                                        SizedBox(width: 8),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            // Background color
                                            shape: BoxShape
                                                .circle, // Circular shape
                                          ),
                                          child: IconButton(
                                            icon: Icon(Icons.add),
                                            onPressed: () =>
                                                incrementQuantity(index),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                        '\$${cartItems[index].price * cartItems[index].quantity}',
                                        style: TextStyle(fontSize: 18)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total amount:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('\$${totalAmount}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange),
                onPressed: showCheckoutSnackbar,
                child: Text('CHECK OUT',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

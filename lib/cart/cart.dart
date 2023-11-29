import 'package:flutter/material.dart';
import 'package:linhkiendientu/cart/buy.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<Map<String, dynamic>> products = [
    {
      'name': 'Card màn hình ASUS ROG Strix GeForce RTX 3060',
      'price': '10.500.000đ',
      'quantity': 1,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJLq9gYlzX1slO3CKzPvc0EzR4XJi0OTd4SK04ilcstmwbyBhVCRFAy2v0zQzqeRdd0Tg&usqp=CAU'
    },

    {
      'name': 'RAM Corsair Dominator Platinum 32GB (2x16GB) RGB 6200 DDR5 (CMT32GX5M2X6200C36)',
      'price': '5.291.000đ',
      'quantity': 1,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxxzIdzNjv8qj0lW4Q5S0Twn5Sr4CwHmVKAFrDG61PXUvcYIxPmJpls6VaSPCu8CXqpMs&usqp=CAU',
    },

    {
      'name': 'Tản nhiệt nước Lian Li 360 Galahad II Trinity Black',
      'price': '5.900.000đ',
      'quantity': '1',
      'imageUrl': 'https://product.hstatic.net/200000722513/product/360inf_b_9848fca1b1d743b7ace73399e8140572_grande.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giỏ hàng'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          var product = products[index];
          return Card(
            child: ListTile(
              leading: Checkbox(
                value: product['isChecked'] ?? false,
                onChanged: (bool? value) {
                  setState(() {
                    product['isChecked'] = value;
                  });
                },
              ),
              title: Row(
                children: <Widget>[
                  Image.network(
                    product['imageUrl'],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(product['name'], overflow: TextOverflow.ellipsis),
                        Text('Giá: ${product['price']}', overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => _confirmDeletion(context, index),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Tổng giá:'), // Tính toán tổng giá của các sản phẩm trong giỏ hàng
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => BuyForm()));
                },
                child: Text('Mua hàng'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _confirmDeletion(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Xóa Sản Phẩm'),
          content: Text('Bạn có chắc muốn xóa sản phẩm này khỏi giỏ hàng không?'),
          actions: <Widget>[
            TextButton(
              child: Text('Hủy'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Xóa'),
              onPressed: () {
                setState(() {
                  products.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
// ignore_for_file: empty_constructor_bodies

import 'package:flutter/material.dart';
import 'cart/cart.dart';
import 'account/security_and_signin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: 'Danh mục sản phẩm',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Danh mục sản phẩm'),
          backgroundColor: Colors.green,
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

//Create class Restaurant
class Product{
  String name;
  double price;
  double quantity;
  String imageUrl;

  Product(this.name, this.price, this.quantity, this.imageUrl);
}

class MyCustomForm extends StatefulWidget{
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm>{
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();
  final _imageUrlController = TextEditingController();

  List<Product> _products = [
    Product('Card màn hình ASUS ROG Strix GeForce RTX 3060', 10500000, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJLq9gYlzX1slO3CKzPvc0EzR4XJi0OTd4SK04ilcstmwbyBhVCRFAy2v0zQzqeRdd0Tg&usqp=CAU'),
    Product('RAM Corsair Dominator Platinum 32GB (2x16GB) RGB 6200 DDR5 (CMT32GX5M2X6200C36)', 5291000, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxxzIdzNjv8qj0lW4Q5S0Twn5Sr4CwHmVKAFrDG61PXUvcYIxPmJpls6VaSPCu8CXqpMs&usqp=CAU'),
    Product('DC-DC Booster Module (0.9V~5V) 5V 600mA', 89000, 3, 'https://ram-e-shop.com/wp-content/uploads/2018/09/dc_dc_300.jpg'),
    Product('Boost Pressure Increase for Kit Fit For 01-04', 102000, 5, 'https://www.vmsracing.com/cdn/shop/products/2_8cc89b44-b942-4479-ad1b-56161b33675f_grande.jpg?v=1461350944'),
    Product('Tản nhiệt nước Lian Li 360 Galahad II Trinity Black', 5900000, 13, 'https://product.hstatic.net/200000722513/product/360inf_b_9848fca1b1d743b7ace73399e8140572_grande.jpg'),
    Product('Bộ vi xử lý Intel Core i9 14900KF / Turbo up to 6.0GHz / 24 Nhân 32 Luồng / 36MB / LGA 1700', 16107000, 10, 'https://songphuong.vn/Content/uploads/2023/10/CPU-Intel-Core-i9-14900-i9-14900F-i9-14900K-i9-14900KF-5.jpg'),
  ];

  void showMessage (String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  //Create method save
  void saveProduct(){
    final name = _nameController.text;
    final price = double.tryParse(_priceController.text) ?? 0.0;
    final quantity = double.tryParse(_quantityController.text) ?? 0.0;
    final imageUrl = _imageUrlController.text;

    setState(() {
      _products.add((Product(name, price, quantity, imageUrl)));
      _nameController.clear();
      _priceController.clear();
      _quantityController.clear();
      _imageUrlController.clear();
    });

    showMessage('Đã lưu');
  }

  //Create method edit
  void editProduct(int index){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Chỉnh sửa thông tin'),
          content: Column(
            children: <Widget>[
              TextField(
                controller: TextEditingController()..text =
                    _products[index].name,
                decoration: InputDecoration(hintText: 'Nhập tên mới'),
                onChanged: (value) => setState(() =>
                _products[index].name = value),
              ),

              TextField(
                controller: TextEditingController()..text =
                    _products[index].name,
                decoration: InputDecoration(hintText: 'Nhập tên mới'),
                onChanged: (value) => setState(() =>
                _products[index].name = value),
              ),

              TextField(
                controller: TextEditingController()..text =
                _products[index].price.toString(),
                decoration: InputDecoration(hintText: 'Nhập giá mới'),
                onChanged: (value) => setState(() =>
                _products[index].price = double.tryParse(value) ?? 0.0,),
              ),

              TextField(
                controller: TextEditingController()..text =
                _products [index].quantity.toString(),
                decoration: InputDecoration(hintText: 'Nhập số lượng sản phẩm mới'),
                onChanged: (value) => setState(() =>
                _products[index].quantity = double.tryParse(value) ?? 0.0,),
              ),

              TextField(
                controller: TextEditingController()..text =
                    _products [index].imageUrl,
                decoration: InputDecoration(hintText: 'Nhập hình ảnh sản phẩm mới'),
                onChanged: (value) => setState(() =>
                _products[index].imageUrl = value),
              ),
            ],
          ),

          actions: <Widget>[
            TextButton(
              child: Text('Lưu'),
              onPressed: () {
                Navigator.of(context).pop();
                showMessage('Đã chỉnh sửa thông tin');
              },
            ),

            TextButton(
              child: Text('Hủy'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //create view method
  void viewProduct(int index){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ListProduct(_products[index]),
      ),
    );
  }

  //create delete method
  void deleteProduct(int index){
    setState(() {
      _products.removeAt(index);
    });
    showMessage('Đã xóa');
  }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Nhập tên',
                labelText: 'Tên'
            ),
          ),

          TextFormField(
            controller: _priceController,
            decoration: InputDecoration(
              icon: Icon(Icons.price_change),
              hintText: 'Nhập giá',
              labelText: 'Giá',
            ),
          ),

          TextFormField(
            controller: _quantityController,
            decoration: InputDecoration(
              icon: Icon(Icons.numbers_rounded),
              hintText: 'Nhập số lượng sản phẩm',
              labelText: 'Số lượng',
            ),
          ),

          TextFormField(
            controller: _imageUrlController,
            decoration: InputDecoration(
              icon: Icon(Icons.image),
              hintText: 'Nhập link hình ảnh',
              labelText: 'Hình ảnh',
            ),
          ),

          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: saveProduct,
                icon: Icon(Icons.save),
                label: Text('Save'),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              ),
            ],
          ),

          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _products.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(_products[index].name),
                subtitle: Text(_products[index].price.toString()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () => viewProduct(index),
                      child: Text('View'),
                      style: ElevatedButton.styleFrom(primary: Colors.orange),
                    ),

                    ElevatedButton(
                      onPressed: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return AlertDialog(
                              title: Text('Thao tác với sản phẩm'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Edit'),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                    editProduct(index);
                                  },
                                ),

                                TextButton(
                                  child: Text('Delete'),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                    deleteProduct(index);
                                  },
                                ),

                                TextButton(
                                  child: Text('Cancel'),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },

                      child: Text('Edit / Delete'),
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(icon: Icon(Icons.home), onPressed: () {
            }),
            IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ShoppingCart()));
            }),
            IconButton(icon: Icon(Icons.person), onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (_) => SecuritySettingsScreen()));
            }),
          ],
        ),
      ),
    );
  }
}

class ListProduct extends StatelessWidget {
  final Product product;

  ListProduct(this.product);

  void navigateToDetailProduct(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailProduct(product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin sản phẩm'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            child: Image.network(
              product.imageUrl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  product.quantity.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                  ),
                ),
                Text(
                  'Giá: ${product.price}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    navigateToDetailProduct(context);
                  },
                  child: Text('Xem chi tiết'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class DetailProduct extends StatelessWidget {
  final Product product;

  DetailProduct(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết sản phẩm'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            child: Image.network(
              product.imageUrl,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  product.quantity.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Giá: ${product.price}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Back'),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'delete_account.dart';
import 'package:linhkiendientu/account/signin.dart';

class SecuritySettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bảo mật và đăng nhập'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Đăng nhập'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => LoginScreen()));
            },
          ),
          Divider(),
          ListTile(
            title: Text('Đổi mật khẩu'),
            onTap: () {
              // Handle change password
            },
          ),
          Divider(),
          ListTile(
            title: Text('Xác thực 2 yếu tố'),
            onTap: () {
            },
          ),
          Divider(),
          ListTile(
            title: Text('Liên kết tài khoản'),
            onTap: () {
              // Handle account linking
            },
          ),
          Divider(),
          ListTile(
            title: Text('Tăng cường bảo mật'),
            onTap: () {
              // Handle enhanced security
            },
          ),
          Divider(),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 1), // The border color and width can be adjusted
              borderRadius: BorderRadius.circular(8), // Adjust the border radius here
            ),
            child: ListTile(
              title: Text(
                'Xóa tài khoản',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green), // Text color can be adjusted
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => DeleteAccountScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
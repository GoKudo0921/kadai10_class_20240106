import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kadai10_class_20240106/utils/authentication.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController selfIntroductionController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  File? image;
  ImagePicker picker = ImagePicker();

  // 画像の取得するための変数
  Future<void> getImageFromGallery() async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // elevation: 0,
        // iconTheme: IconThemeData(color: Colors.black),
        title: Text('新規登録'),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 30,),
              GestureDetector(
                onTap: (){
                  getImageFromGallery();
                },
                child: CircleAvatar(
                  foregroundImage: image == null ? null : FileImage(image!),
                  radius: 40,
                  child: Icon(Icons.add),
                ),
              ),
              Container(
                width: 300,
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: '名前'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  width: 300,
                  child: TextField(
                    controller: userIdController,
                    decoration: InputDecoration(
                        hintText: 'ユーザID'
                    ),
                  ),
                ),
              ),
              Container(
                width: 300,
                child: TextField(
                  controller: selfIntroductionController,
                  decoration: InputDecoration(
                      hintText: '自己紹介'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  width: 300,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: 'メールアドレス'
                    ),
                  ),
                ),
              ),
              Container(
                width: 300,
                child: TextField(
                  controller: passController,
                  decoration: InputDecoration(
                      hintText: 'パスワード'
                  ),
                ),
              ),
              SizedBox(height: 50,),
              ElevatedButton(onPressed: () async{
                if(nameController.text.isNotEmpty
                    && userIdController.text.isNotEmpty
                    && selfIntroductionController.text.isNotEmpty
                    && emailController.text.isNotEmpty
                    && passController.text.isNotEmpty
                    && image != null){
                  var result = await Authentication.signUp(email: emailController.text, pass: passController.text);
                  if (result == true){
                    Navigator.pop(context);
                  }
                }
              }, child: Text('アカウントを作成')
              )
            ],
          ),
        ),
      )
    );
  }
}

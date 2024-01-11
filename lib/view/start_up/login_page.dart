import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kadai10_class_20240106/utils/authentication.dart';
import 'package:kadai10_class_20240106/view/screen.dart';
import 'package:kadai10_class_20240106/view/start_up/create_account_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 50,),
              Text('Flutter　テスト　SNS',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
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
              SizedBox(height: 20,),
              RichText(text: TextSpan(
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(text: 'アカウントを作成していない方は'),
                  TextSpan(
                      text: 'こちら',
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()..onTap = (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccountPage())
                        );
                      }
                  )
                ]
              )
              ),
              SizedBox(height: 70,),
              ElevatedButton(
                  onPressed:() async {
                    var result = await Authentication.emailSignIn(email: emailController.text, pass: passController.text);
                    if(result == true){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Screen())
                      );
                    };
                  },
                  child: Text('emailログイン')
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInScreen extends StatefulWidget {
  State<SignInScreen> createState() => _SignInScreenState();
} 

class _SignInScreenState extends State<SignInScreen>{
  bool _isHidden = true;
  // TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sign in"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Container(
                width: MediaQuery.of(context).size.width-30,
                child: TextField(
                  // controller: textController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Student ID',
                    hintText: 'Enter your School ID'
                  ),
                enableSuggestions: false,
                autocorrect: false,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width-30,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    suffix: GestureDetector(
                      onTap: (){
                        setState(() {
                          _isHidden = !_isHidden;
                        });
                      },
                      child: Icon(
                        _isHidden ? Icons.visibility_off : Icons.visibility
                      ),
                    )
                  ),
                  obscureText: _isHidden,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
              ),
            ]
          ),
        ), 
        floatingActionButton: Container(
          width: 150,
          child: Padding(
            padding: EdgeInsets.only(bottom: 160),
              child: FloatingActionButton.extended(
              onPressed: (){
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => BarsScreen()),
                // );
              }, 
              label: Text(
                'Log in',
                style: TextStyle(
                  fontSize: 20
                  )
                ),
              ),
            ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      )
    );
  }
}

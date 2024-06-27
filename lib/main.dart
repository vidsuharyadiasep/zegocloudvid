import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zegocloudvid/screen/videocallscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zegocloud VC',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Zegocloud Video Call'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _callIdController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _callIdController.dispose();
    super.dispose();
  }

//Generate Call ID >> Represent VC Room/Channel 
void _generateCallId(){
  final value = Random().nextInt(1000) + 1;
  setState(() {
    _callIdController.text = value.toString();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter Your Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)
                        )
                      ),
                    validator: (value){
                      if(value == null || value == ''){
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0,),

                  TextFormField(
                    controller: _callIdController,
                    decoration: InputDecoration(
                      labelText: 'Call ID',
                      hintText: 'Enter Call ID',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)
                        )
                      ),
                    validator: (value){
                      if(value == null || value == ''){
                        return 'Please enter call ID';
                      }
                      return null;
                    },
                  ),

                ],
              )
            ),
            
            FilledButton.tonal(
              onPressed: (){
                _generateCallId();
              }, 
              child: const Text('Generate Call ID'),
            ),

            FilledButton.tonal(
              onPressed: (){
                _startVideoCall();
              }, 
              child: const Text('Video Call'),
            )

          ],
        ),
      ),
    );
  }

  void _startVideoCall(){
    final isValid = _formKey.currentState?.validate();
    if (isValid != null && isValid){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => Videocallscreen(
          userId: (Random().nextInt(100) + 1).toString(), 
          userName: _nameController.text, 
          callId: _callIdController.text)
        )
      );
    }
  }

}

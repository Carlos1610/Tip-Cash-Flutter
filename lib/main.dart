import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

String nome = "";
String senha = "";

class Post {
  final String nome;
  final String senha;

  Post({this.nome, this.senha});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      nome: json['nome'],
      senha: json['senha'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["nome"] = nome;
    map["senha"] = senha;

    return map;
  }
}

Future<Post> createPost(String url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return Post.fromJson(json.decode(response.body));
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter login UI',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      
      ),
      home: MyHomePage(title: 'Flutter Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final nomeController = TextEditingController();
  final senhaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      controller: nomeController,
      obscureText: false,
      style: style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Usuário",
        hintStyle:
            style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
    final passwordField = TextField(
      controller: senhaController,
      obscureText: true,
      style: style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Senha",
        hintStyle:
            style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
    final loginButon = Material(
      elevation: 5.0,
      color: Color.fromRGBO(255, 255, 255, 0.5),
     
      child: MaterialButton(
        
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          nome = nomeController.text;
          senha = senhaController.text;

        
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final cadastroButton = Material(
      elevation: 5.0,
      color: Color.fromRGBO(255, 255, 255, 0.5),
     
      child: MaterialButton(
        
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          nome = nomeController.text;
          senha = senhaController.text;

        Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SecondRoute()),
  );
        },
        child: Text("Abra sua conta",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    
    

    return Scaffold(
      body: Container(
         decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/mobile.png"),
              fit: BoxFit.cover,
            ),
          ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(34.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 250,
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                
                  emailField,
                  SizedBox(height: 25.0),
                  passwordField,
                  SizedBox(
                    height: 35.0,
                  ),
                  loginButon,
                   SizedBox(
                    height: 15.0,
                  ),
                  cadastroButton,
                 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class  SecondRoute extends StatelessWidget{
   TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final nomeController = TextEditingController();
  final senhaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      controller: nomeController,
      obscureText: false,
      style: style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
        hintStyle:
            style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
    final passwordField = TextField(
      controller: senhaController,
      obscureText: true,
      style: style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Senha",
        hintStyle:
            style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
    final loginButon = Material(
      elevation: 5.0,
      color: Color.fromRGBO(255, 255, 255, 0.5),
     
      child: MaterialButton(
        
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          nome = nomeController.text;
          senha = senhaController.text;

        
        },
        child: Text("Criar conta",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final cadastroButton = Material(
      elevation: 5.0,
      color: Color.fromRGBO(255, 255, 255, 0.5),
     
      child: MaterialButton(
        
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          nome = nomeController.text;
          senha = senhaController.text;
  Navigator.pop(context);
        },
        child: Text("Voltar",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    
    

    return Scaffold(
      body: Container(
         decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/mobile.png"),
              fit: BoxFit.cover,
            ),
          ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  emailField,
                  SizedBox(height: 25.0),
                  passwordField,
                  SizedBox(
                    height: 100.0,
                  ),
                  loginButon,
                   SizedBox(
                    height: 15.0,
                  ),
                  cadastroButton,
                 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/" : (context) => Screen1(),
        "/second" : (context) => Screen2(),
      },
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GestureDetector(
            child: Text("Screen One"),
            onTap: () {
              Navigator.pushNamed(context, "/second",arguments: SecondScreenArguments("hello world"));
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return Screen2();
              // }));
            },
          )),
    );
  }
}

class SecondScreenArguments {
  final String message;

  SecondScreenArguments(this.message);
}
class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  static const routeName = "/second";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SecondScreenArguments;
    return Scaffold(
      body: Center(
          child: GestureDetector(
            child: Text(args.message),
            onTap: () {
              Navigator.pop(context);
            },
          )),
    );
  }
}

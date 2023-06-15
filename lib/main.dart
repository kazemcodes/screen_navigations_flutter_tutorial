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
        Screen2.routeName : (context) => Screen2(),
      },
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    // A method that launches the SelectionScreen and awaits the result from
// Navigator.pop.
    Future<void> _navigateAndDisplaySelection(BuildContext context) async {
      // Navigator.push returns a Future that completes after calling
      // Navigator.pop on the Selection Screen.
      final result = await Navigator.pushNamed(context, "/second",arguments: SecondScreenArguments("Hello World"));

      // When a BuildContext is used from a StatefulWidget, the mounted property
      // must be checked after an asynchronous gap.
      if (!context.mounted) return;

      // After the Selection Screen returns a result, hide any previous snackbars
      // and show the new result.
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('$result')));
    }
    return Scaffold(
      body: Center(
          child: GestureDetector(
            child: Text("Screen One"),
            onTap: () {
              _navigateAndDisplaySelection(context);
              //Navigator.pushNamed(context, "/second",arguments: SecondScreenArguments("Hello World"));
              //Navigator.pushNamed(context, "/second");
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
              Navigator.pop(context,"goodbye world");
            },
          )),
    );
  }
}

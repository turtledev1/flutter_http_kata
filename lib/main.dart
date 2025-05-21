import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;
  bool isError = false;
  String message = 'Press the button to send a request';

  Future<void> sendRequest() async {
    setState(() {
      isLoading = true;
    });

    final response = await get(
      Uri.parse(
        'https://fakeresponder.com/?sleep=3000${isError ? '&status=500' : ''}',
      ),
    );

    setState(() {
      isLoading = false;
      message =
          response.statusCode == 200
              ? 'Done!'
              : 'Failed with status: ${response.statusCode}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Kata 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12,
          children: [
            isLoading ? CircularProgressIndicator() : Text(message),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: isLoading ? null : sendRequest,
                  child: Text('Send Request'),
                ),
                const SizedBox(width: 20),
                Checkbox(
                  value: isError,
                  onChanged: (value) {
                    setState(() {
                      isError = value ?? false;
                    });
                  },
                ),
                Text('Error?'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

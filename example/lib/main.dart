import 'package:flutter/material.dart';

// Import package
import 'package:easy_device_id/easy_device_id.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Easy Device Id',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Easy Device Id Example'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            FutureBuilder<String?>(
              future: getDeviceId(false),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.data != null) {
                  return Text(
                    'Non-Storage: ${snapshot.data}',
                  );
                }

                return const CircularProgressIndicator.adaptive();
              },
            ),
            FutureBuilder<String?>(
              future: getDeviceId(true),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.data != null) {
                  return Text(
                    'Storage: ${snapshot.data}',
                  );
                }

                return const CircularProgressIndicator.adaptive();
              },
            )
          ],
        ),
      ),
    );
  }
}

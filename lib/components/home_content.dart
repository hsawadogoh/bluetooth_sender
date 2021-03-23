import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({
    Key key,
  }) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  String devices = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Start scanning
    flutterBlue.startScan(timeout: Duration(seconds: 4));

    // Listen to scan results
    flutterBlue.scanResults.listen((results) {
      // do something with scan results
      for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.rssi}');
        devices = devices + '${r.device.name} found! rssi: ${r.rssi}';
      }
    });

    // Stop scanning
    flutterBlue.stopScan();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              RefreshIndicator(
                onRefresh: () => FlutterBlue.instance.startScan(timeout: Duration(seconds: 4)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          devices
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}

// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class LifecycleWatcher extends StatefulWidget {
  const LifecycleWatcher({Key? key}) : super(key: key);

  @override
  _LifecycleWatcherState createState() => _LifecycleWatcherState();
}

class _LifecycleWatcherState extends State<LifecycleWatcher>
    with WidgetsBindingObserver {
  late AppLifecycleState _lastLifecyleState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // @override
  void onDeactivate() {
    super.deactivate();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _lastLifecyleState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    if (_lastLifecyleState == null) {
      return const Text('This widget has not observed any lifecycle changes.');
    }
    return Text(
        'The most recent lifecycle state this widget observed was: $_lastLifecyleState.');
  }
}

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:emed/services/get_storage/get_storage_service.dart';
import 'package:emed/views/no_internet/no_internet_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';

class BaseView<T> extends StatefulWidget {
  final T? viewModel;
  final Widget Function(BuildContext context, T value)? onPageBuilder;
  final Function(T model)? onModelReady;
  final VoidCallback? onDispose;

  const BaseView({
    Key? key,
    required this.viewModel,
    required this.onPageBuilder,
    this.onModelReady,
    this.onDispose,
  }) : super(key: key);

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> with WidgetsBindingObserver {
  dynamic subscription;
  dynamic internetStatus;

  int _timerCount = 0;
  Timer? _timer;

  void _incrementTimerCounter(Timer t) async {
    if (_timerCount == 30) {
      await GetStorageService.inherentce.box.write('isLock', true);
      _timer!.cancel();
    }
    _timerCount += 1;
    setState(() {});
  }

  // * LIFECYCLE CHANGE CONTROL
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    _timer = Timer(const Duration(microseconds: 1), () {});
    if (state == AppLifecycleState.resumed) {
      _timerCount = 0;
      debugPrint("RESUMED SUCCESS ! ! ! ! ! !  ! ! !");
      _timer!.cancel();
    }
    if (state == AppLifecycleState.inactive) return;
    if (state == AppLifecycleState.paused) {
      _timer = Timer.periodic(
          const Duration(microseconds: 300), _incrementTimerCounter);
    }

    if (state == AppLifecycleState.detached) {
      await GetStorageService.inherentce.box.write("isLock", true);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    GetStorageService.inherentce.box.write('isLock', false);
    subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        setState(
          () {
            // debugPrint(result.toString());
            internetStatus = result;
          },
        );
      },
    );
    if (widget.onModelReady != null) widget.onModelReady!(widget.viewModel);
  }

  @override
  Widget build(BuildContext context) {
    return returnPage();
  }

  Widget returnPage() {
    if (internetStatus == ConnectivityResult.none) {
      return const NoInternetView();
    } else {
      if (!GetStorageService.inherentce.box.read('isLock')) {
        return widget.onPageBuilder!(context, widget.viewModel);
      } else {
        return ScreenLock(
          correctString: "1011",
          canCancel: false,
          didUnlocked: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
            );
          },
          didConfirmed: (pin) {
            setState(
              () {
                GetStorageService.inherentce.box.write("isLock", false);
                _timerCount = 0;
              },
            );
          },
        );
      }
    }
  }

  @override
  void dispose() {
    _timer = Timer.periodic(const Duration(seconds: 1), (s) {});
    _timer!.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!();
  }
}

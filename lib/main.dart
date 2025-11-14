import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zhuque_flutter_demo/app/app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: TuniaoApp(),
    ),
  );
}

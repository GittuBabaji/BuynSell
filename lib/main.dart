import 'package:flutter/material.dart';
import 'package:buynsell/app.dart';
import 'package:buynsell/util/storage/storage_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize services
  await TLocalStorage.init();
  // TODO: Initialize Firebase, notifications, etc.

  runApp(const ProviderScope(child: BuyNSellApp()));
}

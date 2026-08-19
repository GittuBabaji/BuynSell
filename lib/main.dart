import 'package:flutter/material.dart';
import 'package:buynsell/app.dart';
import 'package:buynsell/util/storage/storage_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize services
  await TLocalStorage.init();
  // TODO: Initialize Firebase, notifications, etc.

  runApp(const BuyNSellApp());
}

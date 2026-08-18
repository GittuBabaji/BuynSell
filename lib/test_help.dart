import 'dart:io';

Future<void> help() async {
  try {
    final result = await InternetAddress.lookup('thispersondoesnotexist.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      stdout.writeln('Connected to the internet');
    } else {
      stdout.writeln('No internet connection');
    }
  } catch (e) {
    stdout.writeln('No internet connection: $e');
  }
}

void main() async {
  stdout.writeln('Running internet connection test...');
  await help();
}

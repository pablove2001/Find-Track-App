import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:record/record.dart';

// Iniciar a grabar el audio
Future<void> startRecord(Record audioRecorder) async {
  try {
    if (await audioRecorder.hasPermission()) {
      await audioRecorder.isEncoderSupported(
        AudioEncoder.aacLc,
      );
      await audioRecorder.start();
      await Future.delayed(const Duration(seconds: 8));
      await stopRecord(audioRecorder);
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}

// Terminar de grabar el audio
Future<void> stopRecord(Record audioRecorder) async {
  final path = await audioRecorder.stop();
  if (kDebugMode) {
    print('El path es: $path');
  }

  if (path != null) {
    if (kDebugMode) {
      print('se ejecuta transofrmacion');
      print(await convertM4aToBase64(path));
    }
  }
}

// Convertir de .m4a a Base64
Future<String> convertM4aToBase64(String filePath) async {
  final file = File(filePath);
  if (!file.existsSync()) throw Exception("El archivo no existe");

  final bytes = await file.readAsBytes();
  final base64Str = base64Encode(bytes);

  if (kDebugMode) {
    print('la base64 es: $base64Str');
  }
  return base64Str;
}

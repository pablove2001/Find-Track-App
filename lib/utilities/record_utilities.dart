import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:record/record.dart';

// Iniciar a grabar el audio
Future<String?> startRecord(Record audioRecorder) async {
  try {
    if (await audioRecorder.hasPermission()) {
      await audioRecorder.isEncoderSupported(
        AudioEncoder.aacLc,
      );
      await audioRecorder.start();
      await Future.delayed(const Duration(seconds: 8));
      return await stopRecord(audioRecorder);
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
  return null;
}

// Terminar de grabar el audio
Future<String?> stopRecord(Record audioRecorder) async {
  final path = await audioRecorder.stop();
  if (kDebugMode) {
    print('El path es: $path');
  }

  if (path != null) {
    if (kDebugMode) {
      print('se ejecuta transofrmacion');
    }

    return await convertM4aToBase64(path);
  }
  return null;
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

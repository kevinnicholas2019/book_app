import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData theme() => ThemeData.light().copyWith(
      primaryColor: Colors.green[800],
      appBarTheme: ThemeData.light().appBarTheme.copyWith(
            color: Colors.green[800],
            iconTheme: ThemeData.dark().iconTheme,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontFamily: 'Arial',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent),
    );

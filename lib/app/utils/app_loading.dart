import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppLoading extends StatelessWidget {
  const CustomAppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS
          ? const CupertinoActivityIndicator()
          : const CircularProgressIndicator(),
    );
  }
}

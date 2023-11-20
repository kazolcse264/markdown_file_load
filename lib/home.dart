import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: rootBundle.loadString("assets/term_of_use.md"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Markdown(
                data: snapshot.data!,
                styleSheet: MarkdownStyleSheet(
                  h1Align: WrapAlignment.center,
                  h1: const TextStyle(
                    fontWeight: FontWeight.bold,
                    ///for spacing above underline
                    /*  decoration: TextDecoration.underline,
                      color: Colors.transparent,
                      shadows:[
                        Shadow(offset: Offset(0,-5),color: Colors.black),
                      ]*/
                  ),
                  h6Align: WrapAlignment.spaceEvenly,
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
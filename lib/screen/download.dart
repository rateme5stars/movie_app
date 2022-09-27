import 'package:flutter/material.dart';

class Download extends StatefulWidget {
  const Download({Key? key}) : super(key: key);

  @override
  State<Download> createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Download',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

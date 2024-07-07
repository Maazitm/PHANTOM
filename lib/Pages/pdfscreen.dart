import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class PdfListScreen extends StatefulWidget {
  @override
  _PdfListScreenState createState() => _PdfListScreenState();
}

class _PdfListScreenState extends State<PdfListScreen> {
  List<Map<String, dynamic>> _pdfFiles = [];
  Map<String, bool> _downloadingStatus = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPdfFiles();
  }

  Future<void> _fetchPdfFiles() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    ListResult result = await storage.ref().listAll();

    List<Reference> allFiles = result.items;
    List<Reference> pdfFiles =
        allFiles.where((file) => file.name.endsWith('.pdf')).toList();

    setState(() {
      _pdfFiles =
          pdfFiles.map((file) => {'name': file.name, 'ref': file}).toList();
      _isLoading = false;
    });
  }

  Future<void> _downloadAndOpenPdf(String fileName, Reference fileRef) async {
    setState(() {
      _downloadingStatus[fileName] = true;
    });

    String downloadURL = await fileRef.getDownloadURL();
    final Directory tempDir = await getTemporaryDirectory();
    final File file = File('${tempDir.path}/$fileName');

    if (await file.exists()) {
      _openPdf(file.path);
    } else {
      final http.Response response = await http.get(Uri.parse(downloadURL));
      await file.writeAsBytes(response.bodyBytes);
      _openPdf(file.path);
    }
  }

  void _openPdf(String filePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfViewScreen(pdfPath: filePath),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Files'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _pdfFiles.length,
              itemBuilder: (context, index) {
                final fileName = _pdfFiles[index]['name'];
                final fileRef = _pdfFiles[index]['ref'];
                final isDownloading =
                    _downloadingStatus.containsKey(fileName) &&
                        _downloadingStatus[fileName] == true;

                return ListTile(
                  leading: Icon(
                    Icons.picture_as_pdf_rounded,
                    color: Colors.red.shade800,
                  ),
                  title: Text(fileName),
                  onTap: () {
                    _downloadAndOpenPdf(fileName, fileRef);
                  },
                  // trailing: isDownloading ? CircularProgressIndicator() : null,
                );
              },
            ),
    );
  }
}

class PdfViewScreen extends StatelessWidget {
  final String pdfPath;

  PdfViewScreen({required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: PDFView(
        filePath: pdfPath,
      ),
    );
  }
}

# customerdata_sqflite

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Future<dynamic> getpdfReport() async {
  final response = await http.get(Uri.parse(pdfUrl));
  if (response.statusCode == 200) {

    //// open in pdf format
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/Sales Report.pdf');
    await file.writeAsBytes(response.bodyBytes);
    OpenFile.open(file.path);


  } else {
    throw Exception('Failed to load Data');
  }
}

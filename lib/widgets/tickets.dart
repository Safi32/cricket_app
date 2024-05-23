import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class TicketsScreen extends StatefulWidget {
  static const routeName = "ticketScreen";
  const TicketsScreen({Key? key}) : super(key: key);

  @override
  State<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<Uint8List> _createPDF(PdfPageFormat format) async {
    final pdf = pw.Document(
      version: PdfVersion.pdf_1_4,
      compress: true,
    );

    final image = await _loadAssetImage("assets/barcode 1.png");

    pdf.addPage(
      pw.Page(
        pageFormat: const PdfPageFormat(80 * PdfPageFormat.mm, 350,
            marginAll: 5 * PdfPageFormat.mm),
        build: (context) {
          return pw.Center(
            child: pw.Container(
              decoration: pw.BoxDecoration(
                borderRadius: pw.BorderRadius.circular(20),
              ),
              child: pw.Column(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.symmetric(vertical: 10),
                    child: pw.Text(
                      "Team Gunner vs Team Star",
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  pw.Divider(thickness: 0.9, color: PdfColors.black),
                  pw.Column(
                    children: [
                      pw.Row(
                        children: [
                          pw.Padding(
                            padding:
                                const pw.EdgeInsets.symmetric(vertical: 10),
                            child: pw.Row(
                              children: [
                                pw.Text(
                                  "Ticket id: ",
                                  style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                                pw.Text("19208",
                                    style: const pw.TextStyle(
                                      fontSize: 10,
                                    )),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding:
                                const pw.EdgeInsets.symmetric(horizontal: 10),
                            child: pw.Row(
                              children: [
                                pw.Text(
                                  "Venue: ",
                                  style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                                pw.Text(
                                  "Defenders  \n Cricket Ground",
                                  style: const pw.TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Row(
                            children: [
                              pw.Text(
                                "Date: ",
                                style: pw.TextStyle(
                                  fontSize: 10,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                              pw.Text(
                                "09 April 2024",
                                style: const pw.TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                          pw.Row(
                            children: [
                              pw.Text(
                                "Match Time: ",
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                              pw.Text(
                                "10:00 pm",
                                style: const pw.TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                      pw.SizedBox(height: 10),
                      pw.Divider(thickness: 0.9, color: PdfColors.black),
                      pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 5),
                        child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              "Total",
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                            pw.Text("2000/="),
                          ],
                        ),
                      ),
                      pw.SizedBox(height: 30),
                      pw.Image(
                        pw.MemoryImage(image),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );

    return pdf.save();
  }

  Future<Uint8List> _loadAssetImage(String path) async {
    final byteData = await rootBundle.load(path);
    return byteData.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ticket Detail",
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: PdfPreview(
        build: (format) => _createPDF(format),
        onPrinted: (context) =>
            _showSnackbar(context, 'Document printed successfully'),
        onShared: (context) =>
            _showSnackbar(context, 'Document shared successfully'),
        actions: [
          PdfPreviewAction(
            icon: const Icon(Icons.save),
            onPressed: (context, _, __) async {},
          ),
        ],
        padding: const EdgeInsets.all(10),
      ),
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}

class ButtonContainer extends StatelessWidget {
  final Color color;
  final Color borderColor;
  final Color textColor;
  final String text;

  const ButtonContainer({
    Key? key,
    required this.color,
    required this.borderColor,
    required this.textColor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: borderColor),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}

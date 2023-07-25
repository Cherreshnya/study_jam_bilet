import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/screen_tiket.dart';

/// Экран “Хранения билетов”.
class TicketStoragePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Хранение билетов",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: buildBody(
      ),
    );
  }
}




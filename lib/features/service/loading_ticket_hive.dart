import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/ticket_storage_page.dart';

final tiketPage =
StateNotifierProvider<TiketStoragePageStateNotifer, TicketStoragePageModel>(
        (ref) {
      return TicketStoragePageNotifer(
        TicketStoragePageModel(
          tikets: [],
        ),
      );
    });

class TiketStoragePageStateNotifer
    extends StateNotifier<TicketStoragePageModel> {
  TiketStoragePageStateNotifer(super.state) {
    _load();
  }

  @override
  get state => super.state;

  void _load() async {
    final box = await Hive.openBox("tikets"); //Добавляется бокс "tikets"
    final list = List<Ticket>.from(box.get("tickets") ?? []);
    state = state.copyWith(tickets: list);
  }

  void _save() {
    Hive.box("tikets").put("tickets", state.tickets);
  }

  void addTicket(Ticket ticket) {
    state = state.copyWith(
      tickets: [...state.tickets, ticket],
    );
    _save();
  }

  void editTicket(Ticket ticket) {
    state = state.copyWith(
      tickets:
      state.tickets.map((e) => e.url == ticket.url ? ticket : e).toList(),
    );
    _save();
  }

  void removeTicket(Ticket ticket) {
    state = state.copyWith(
      tickets: state.tickets.where((e) => e.url != ticket.url).toList(),
    );
    _save();
  }
}

}
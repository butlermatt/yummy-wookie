@HtmlImport('main_app.html')
library dart_slides.main.app;

import 'dart:async';

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:dslink/browser.dart';

import 'package:polymer_elements/paper_header_panel.dart';
import 'package:polymer_elements/paper_toolbar.dart';

import 'src/slide_deck.dart';

@PolymerRegister('main-app')
class MainApp extends PolymerElement {
  SlideDeck deck;
  LinkProvider link;
  Requester req;
  int currentPage = 0;

  MainApp.created() : super.created() {
    link = new LinkProvider('http://rnd.iot-dsa.org/conn', 'YummyViewer-',
      isResponder: false, isRequester: true);
    initConnection();
  }

  @override
  void ready() {
    deck = $['deck'];
  }

  @reflectable
  Future initConnection() async {
    await link.connect();
    req = await link.onRequesterReady;
    req.subscribe('/data/YummyWookie/page', pageUpdated);
  }

  @reflectable
  void pageUpdated(ValueUpdate update) {
    currentPage = update.value;
    print('Page updated: $currentPage');
    deck.changePage(currentPage);
  }
}
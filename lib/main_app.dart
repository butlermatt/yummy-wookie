@HtmlImport('main_app.html')
library dart_slides.main.app;

import 'dart:async';
import 'dart:html';

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:dslink/browser.dart';

import 'package:polymer_elements/paper_header_panel.dart';
import 'package:polymer_elements/paper_toolbar.dart';
import 'package:polymer_elements/paper_fab.dart';
import 'package:polymer_elements/iron_icons.dart';
import 'package:polymer_elements/av_icons.dart';

import 'src/slide_deck.dart';

@PolymerRegister('main-app')
class MainApp extends PolymerElement {
  static const path = '/data/YummyWookie/page';
  static const tapPath = '/data/YummyWookie/tap';

  PaperFab pause;
  SlideDeck deck;
  LinkProvider link;
  Requester req;
  int currentPage = 0;
  bool isPaused = false;

  MainApp.created() : super.created() {
    link = new LinkProvider('http://rnd.iot-dsa.org/conn', 'YummyViewer-',
      isResponder: false, isRequester: true);
    initConnection();
  }

  @override
  void ready() {
    pause = $['pause'];
    deck = $['deck'];
  }

  @reflectable
  Future initConnection() async {
    await link.connect();
    req = await link.onRequesterReady;
    req.subscribe(path, pageUpdated);
    req.subscribe(tapPath, cardTap);
  }

  @reflectable
  void pageUpdated(ValueUpdate update) {
    currentPage = update.value;
    if (!isPaused) {
      deck.changePage(currentPage);
    }
  }

  @reflectable
  void cardTap(ValueUpdate update) {
    var tapNum = update.value;
    deck.cardTapped(currentPage, tapNum);
  }

  @reflectable
  void onPaused(Event e, [_]) {
    isPaused = !isPaused;
    if (isPaused) {
      pause.icon = 'av:play-arrow';
    } else {
      pause.icon = 'av:pause';
      deck.changePage(currentPage);
    }
  }
}
@HtmlImport('presenter_app.html')
library dart_slides.presenter.app;

import 'dart:async';
import 'dart:html';

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:dslink/browser.dart';

import 'package:polymer_elements/paper_header_panel.dart';
import 'package:polymer_elements/paper_toolbar.dart';

import 'src/slide_deck.dart';

@PolymerRegister('presenter-app')
class PresenterApp extends PolymerElement {
  static const path = '/data/YummyWookie/page';

  SlideDeck deck;
  LinkProvider link;
  Requester req;
  LocalNode node;
  int currentPage = 0;

  PresenterApp.created() : super.created() {
    link = new LinkProvider('http://10.0.1.155:8080/conn', 'YummyWookie-',
        isResponder: false);
    initConnection();
  }

  Future initConnection() async {
    await link.connect();
    req = await link.onRequesterReady;
    req.set(path, currentPage);
  }

  @reflectable
  void ready() {
    deck = $['deck'];
  }
}
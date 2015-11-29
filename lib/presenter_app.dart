@HtmlImport('presenter_app.html')
library dart_slides.presenter.app;

import 'dart:async';
import 'dart:html';

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:dslink/browser.dart';

import 'package:polymer_elements/paper_header_panel.dart';
import 'package:polymer_elements/paper_toolbar.dart';
import 'package:polymer_elements/paper_fab.dart';
import 'package:polymer_elements/iron_icons.dart';

import 'src/slide_deck.dart';

@PolymerRegister('presenter-app')
class PresenterApp extends PolymerElement {
  static const path = '/data/YummyWookie/page';
  static const tapPath = '/data/YummyWookie/tap';

  PaperFab fabForward;
  PaperFab fabBack;
  SlideDeck deck;
  LinkProvider link;
  Requester req;
  LocalNode node;
  int currentPage = 0;

  int tappedNum = 0;

  PresenterApp.created() : super.created() {
    link = new LinkProvider('http://rnd.iot-dsa.org/conn', 'YummyWookie-',
        isResponder: false);
    initConnection();
  }

  Future initConnection() async {
    await link.connect();
    req = await link.onRequesterReady;
    req.set(path, currentPage);
    req.subscribe(path, pathUpdated);
    req.subscribe(tapPath, cardTap);
  }

  @reflectable
  void pathUpdated(ValueUpdate update) {
    var page = update.value;
    tappedNum = 0;
    deck.changePage(page);
  }

  @reflectable
  void cardTap(ValueUpdate update) {
    var tapNum = update.value;
    deck.cardTapped(currentPage, tapNum);
  }

  @reflectable
  void onCardTap(e, [_]) {
    req.set(tapPath, ++tappedNum);
  }

  @reflectable
  void ready() {
    deck = $['deck'];
    fabForward = $['forward'];
    fabBack = $['back'];
    fabBack.disabled = true;
    fabForward.on['tap'].listen((Event e) {
      req.set(path, ++currentPage);
      if (fabBack.disabled) {
        fabBack.disabled = false;
      }
    });
    fabBack.on['tap'].listen((Event e) {
      --currentPage;
      currentPage = (currentPage < 0 ? 0 : currentPage);
      if (currentPage == 0) {
        fabBack.disabled = true;
      }
      req.set(path, currentPage);
    });
  }
}
@HtmlImport('main_app.html')
library dart_slides.main.app;

import 'dart:async';

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:dslink/browser.dart';

import 'package:polymer_elements/paper_header_panel.dart';
import 'package:polymer_elements/paper_toolbar.dart';

@PolymerRegister('main-app')
class MainApp extends PolymerElement {
  LinkProvider link;
  Requester req;
  int currentPage = 0;

  MainApp.created() : super.created() {
    link = new LinkProvider('http://10.0.1.155:8080/conn', 'YummyViewer-',
      isResponder: false, isRequester: true);
    initConnection();
  }

  @reflectable
  Future initConnection() async {
    await link.connect();
    req = await link.onRequesterReady;
    req.subscribe('/downstream/YummyWookie/page', pageUpdated);
  }

  @reflectable
  void pageUpdated(ValueUpdate update) {
    currentPage = update.value;
    print('Page updated: $currentPage');
  }
}
@HtmlImport('presenter_app.html')
library dart_slides.presenter.app;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:dslink/browser.dart';

import 'package:polymer_elements/paper_header_panel.dart';
import 'package:polymer_elements/paper_toolbar.dart';

@PolymerRegister('presenter-app')
class PresenterApp extends PolymerElement {
  LinkProvider link;
  int currentPage = 0;

  PresenterApp.created() : super.created() {
    link = new LinkProvider('http://10.0.1.155:8080/conn', 'YummyWookie-',
        defaultNodes: {
          'page': {
            r'$name' : 'Page',
            r'$type' : 'int',
            r'?value' : currentPage
          }
        });
    link.connect();
  }
}
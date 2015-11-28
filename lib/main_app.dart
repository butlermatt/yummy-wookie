@HtmlImport('main_app.html')
library dart_slides.main.app;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

import 'package:polymer_elements/paper_header_panel.dart';
import 'package:polymer_elements/paper_toolbar.dart';

@PolymerRegister('main-app')
class MainApp extends PolymerElement {
  MainApp.created() : super.created();
}
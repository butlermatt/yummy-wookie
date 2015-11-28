@HtmlImport('slide_deck.html')
library dart_slides.slide.deck;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';

@PolymerRegister('slide-deck')
class SlideDeck extends PolymerElement {
  @property
  bool presenter;

  SlideDeck.created() : super.created();

  void ready() {
    print(presenter);
  }
}
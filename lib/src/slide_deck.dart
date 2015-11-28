@HtmlImport('slide_deck.html')
library dart_slides.slide.deck;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';
import 'package:polymer_elements/paper_card.dart';

@PolymerRegister('slide-deck')
class SlideDeck extends PolymerElement {
  @property
  bool presenter;
  @property
  int page = 0;

  SlideDeck.created() : super.created();

  @override
  void ready() {

  }

  @reflectable
  void changePage(int newPage) {
    notifyPath('page', newPage);
  }
}
@HtmlImport('slide_deck.html')
library dart_slides.slide.deck;

import 'dart:html';

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';

import 'package:polymer_elements/paper_fab.dart';
import 'package:polymer_elements/iron_icons.dart';
import 'package:polymer_elements/av_icons.dart';

import 'slide_card.dart';

@PolymerRegister('slide-deck')
class SlideDeck extends PolymerElement {
  @property
  bool presenter = false;

  int page = 0;
  List<SlideCard> cardList;

  SlideDeck.created() : super.created();

  int benNum = 0;

  @override
  void ready() {
    cardList = Polymer.dom($['cards']).querySelectorAll('slide-card');
  }

  @reflectable
  void changePage(int newPage) {
    cardList[page].hidden = true;

    if (newPage > (cardList.length - 1)) {
      page = cardList.length - 1;
    } else if (newPage < 0) {
      page = 0;
    } else {
      page = newPage;
    }
    cardList[page].hidden = false;
  }

  @reflectable
  void cardTapped(int card, int tapNum) {
    var el = Polymer.dom(cardList[card]).querySelector('[hidden]');
    el?.hidden = false;
  }

}
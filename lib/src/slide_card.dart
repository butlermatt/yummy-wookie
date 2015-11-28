@HtmlImport('slide_card.html')
library dartslides.slide.card;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';

import 'package:polymer_elements/paper_card.dart';

@PolymerRegister('slide-card')
class SlideCard extends PolymerElement {
  @property
  String heading;
  @property
  bool presenter;

  SlideCard.created() : super.created();

  @reflectable
  void tapped(e, [_]) {
    fire('card-tap');
  }
}
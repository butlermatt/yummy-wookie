@HtmlImport('slide_card.html')
library dartslides.slide.card;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';

import 'package:polymer_elements/paper_card.dart';

@PolymerRegister('slide-card')
class SlideCard extends PolymerElement {
  @property
  String heading;

  SlideCard.created() : super.created();

}
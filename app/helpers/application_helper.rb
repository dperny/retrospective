module ApplicationHelper
  def spinner
  "<svg width=\"70\" height=\"20\">
    <rect width=\"20\" height=\"20\" x=\"0\" y=\"0\" rx=\"3\" ry=\"3\">
    <animate attributeName=\"width\" values=\"0;20;20;20;0\" dur=\"1000ms\" repeatCount=\"indefinite\"/>
    <animate attributeName=\"height\" values=\"0;20;20;20;0\" dur=\"1000ms\" repeatCount=\"indefinite\"/>
    <animate attributeName=\"x\" values=\"10;0;0;0;10\" dur=\"1000ms\" repeatCount=\"indefinite\"/>
    <animate attributeName=\"y\" values=\"10;0;0;0;10\" dur=\"1000ms\" repeatCount=\"indefinite\"/>
    </rect>
    <rect width=\"20\" height=\"20\" x=\"25\" y=\"0\" rx=\"3\" ry=\"3\">
    <animate attributeName=\"width\" values=\"0;20;20;20;0\" begin=\"200ms\" dur=\"1000ms\" repeatCount=\"indefinite\"/>
    <animate attributeName=\"height\" values=\"0;20;20;20;0\" begin=\"200ms\" dur=\"1000ms\" repeatCount=\"indefinite\"/>
    <animate attributeName=\"x\" values=\"35;25;25;25;35\" begin=\"200ms\" dur=\"1000ms\" repeatCount=\"indefinite\"/>
    <animate attributeName=\"y\" values=\"10;0;0;0;10\" begin=\"200ms\" dur=\"1000ms\" repeatCount=\"indefinite\"/>
    </rect>
    <rect width=\"20\" height=\"20\" x=\"50\" y=\"0\" rx=\"3\" ry=\"3\">
    <animate attributeName=\"width\" values=\"0;20;20;20;0\" begin=\"400ms\" dur=\"1000ms\" repeatCount=\"indefinite\"/>
    <animate attributeName=\"height\" values=\"0;20;20;20;0\" begin=\"400ms\" dur=\"1000ms\" repeatCount=\"indefinite\"/>
    <animate attributeName=\"x\" values=\"60;50;50;50;60\" begin=\"400ms\" dur=\"1000ms\" repeatCount=\"indefinite\"/>
    <animate attributeName=\"y\" values=\"10;0;0;0;10\" begin=\"400ms\" dur=\"1000ms\" repeatCount=\"indefinite\"/>
    </rect>"
  end
end

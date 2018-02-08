import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

@Component(selector: 'org-node-renderer',
    templateUrl: 'org_node_renderer.html',
    directives: const [CORE_DIRECTIVES]
)
class OrgNodeRenderer extends RendersValue {
  var value;

  bool showActionButtons = false;

  OrgNodeRenderer() {
    print("$runtimeType()");
  }

  void addNode(MouseEvent event, Map node) {
    // don't let click get handled by tree control
    event.stopPropagation();

    Map newNode = {
      "_name": "NEW!",
      "_guid": "{whatever}"
    };

    // add new node to tree
    node['_optionGroup'].add(newNode);

    // TODO: Different node types and child types will need to be added differently.
    node[newNode['_name']] = newNode;
  }

  void onCheese(MouseEvent event, Map node) {
    event.stopPropagation();
    print("$runtimeType::onCheese(${node})");
  }

  @HostListener('mouseenter')
  void onMouseEnter() {
    showActionButtons = true;
  }

  @HostListener('mouseleave')
  void onMouseLeave() {
    showActionButtons = false;
  }

  bool get canHaveChildren =>
      value['_type'] == "container" ||
      value['_type'] == "building" ||
      (value['_type'] == "commercial" && !value['_isSubmeter']);
}
import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_components/model/selection/select.dart';
import 'package:angular_components/model/selection/selection_model.dart';
import 'package:angular_components/model/selection/selection_options.dart';

//import '../../services/logger_service.dart';
import 'renderers/org_node_renderer.dart';

@Component(selector: 'org-tree',
    templateUrl: 'org_tree.html',
    directives: const [materialDirectives, OrgNodeRenderer],
    providers: const []
)
class OrgTree {
//  final LoggerService _log;

  Map _org;
//  Type _renderer;

  SelectionOptions _options;
  OptionGroup _topLevel;
  Map<Map, List<OptionGroup<Map>>> _children;

  OrgTree(/*LoggerService this._log*/) {
//    _log.info("$runtimeType()");
  }

  void _init() {
    if (org == null/* || renderer == null*/) {
      return;
    }

    _createOptions(org);
  }

  void _createOptions(Map org) {
    _children = {};

    if (org['_type'] == "org" || org['_type'] == "container") {
      _topLevel = new OptionGroup([]);

      for (String key in org.keys) {
        var value = org[key];

        if (!key.startsWith("_")) {
          value["_name"] = key;
          _topLevel.add(value);
        }
      }

      _topLevel.forEach((Map node) {
        _discoverChildNodes(node);
      });
    }
    else if (org['_type'] == "building") {
      org["_name"] = "Building";
      _topLevel = new OptionGroup([org]);
      _discoverMeters(org);
    }

    _options = new _NestedSelectionOptions<Map>([_topLevel], _children);
  }

  void _discoverChildNodes(Map node) {
    for (String key in node.keys) {
      var value = node[key];

      if (!key.startsWith("_")) {
        value["_name"] = key;

        if (_children[node] == null) {
          _children[node] = [new OptionGroup([value])];
        }
        else {
          _children[node].first.add(value);
        }

        // make sure parent has a reference to this option group for adding new nodes
        scheduleMicrotask(() => node["_optionGroup"] ??= _children[node].first);

        // process and add any meters
        if (value['_type'] == "building") {
          _discoverMeters(value);
        }
        else {
          // TODO: Run discoverChildNodes() recursively on node types that need it (maybe just containers?)
        }
      }
    }
  }

  void _discoverMeters(Map node) {
    if (node.containsKey("_meters")) {
      Map metersNode = node["_meters"];

      for (String utilityType in metersNode.keys) {
        if (utilityType != "init") {
          metersNode[utilityType].forEach((String meterName, Map meterMap) {
            meterMap["_name"] = meterName;
            meterMap["_utilityType"] = utilityType.substring(1);
            meterMap["_isSubmeter"] = false;

            if (_children[node] == null) {
              _children[node] = [new OptionGroup([meterMap])];
            }
            else {
              _children[node].first.add(meterMap);
            }

            // make sure parent has a reference to this option group for adding new nodes
            scheduleMicrotask(() => node["_optionGroup"] ??= _children[node].first);

            // process and add any submeters
            if (meterMap.containsKey("_submeters")) {
              Map submetersNode = meterMap["_submeters"];

              submetersNode.forEach((String submeterName, Map submeterMap) {
                submeterMap["_name"] = submeterName;
                submeterMap["_utilityType"] = utilityType.substring(1);
                submeterMap["_isSubmeter"] = true;

                if (_children[meterMap] == null) {
                  _children[meterMap] = [new OptionGroup([submeterMap])];
                }
                else {
                  _children[meterMap].first.add(submeterMap);
                }

                // make sure parent has a reference to this option group for adding new nodes
                scheduleMicrotask(() => meterMap["_optionGroup"] ??= _children[meterMap].first);
              });
            }
          });
        }
      }
    }
  }

  Type compRenderer(var item) {
    return OrgNodeRenderer;
  }

  SelectionOptions get options =>_options;

  Map get org => _org;
  @Input() void set org(Map value) {
    if (value != null && value.isNotEmpty) {
      _org = value;
      print("$runtimeType::org() -- $org");
      _init();
    }
  }

  // TODO: Allow for passing in a custom renderer function (not [Type], as it is here).
//  Type get renderer => _renderer;
//  @Input() void set renderer(Type value) {
//    if (value == _renderer) {
//      return;
//    }
//
//    _renderer = value;
//
//    scheduleMicrotask(_init);
//  }
}

/// An example implementation of [SelectionOptions] with [Parent].
class _NestedSelectionOptions<T> extends SelectionOptions<T> implements Parent<T, List<OptionGroup<T>>> {
  final Map<T, List<OptionGroup<T>>> _children;

  _NestedSelectionOptions(List<OptionGroup<T>> options, this._children) : super(options);

  @override
  bool hasChildren(T item) => _children.containsKey(item);

  @override
  DisposableFuture<List<OptionGroup<T>>> childrenOf(T parent, [_]) {
    return new DisposableFuture<List<OptionGroup<T>>>.fromValue(_children[parent]);
  }
}

// TODO: Figure out how to use meter and submeter icons. (How does the org-browser do it?)

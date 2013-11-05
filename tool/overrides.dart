
/**
 * A library to query the declaritive overrides for Chrome API generation. See
 * the `meta/overrides.json` file.
 */
library overrides;

import 'dart:convert';
import 'dart:io';

class Overrides {

  Map renameNamespaceMap;

  List<String> suppressClassList;
  List<String> suppressMethodList;
  Map renameClassMap;

  Overrides() {
    _init({});
  }

  Overrides.fromFile(File file) {
    _init(JSON.decode(file.readAsStringSync()));
  }

  void _init(Map m) {
    renameNamespaceMap = m['renameNamespace'];
    if (renameNamespaceMap == null) {
      renameNamespaceMap = {};
    }

    suppressClassList = m['suppressClass'];
    if (suppressClassList == null) {
      suppressClassList = [];
    }

    suppressMethodList = ['noGen'];
    if (suppressMethodList == null) {
      suppressMethodList = [];
    }

    renameClassMap = m['renameClass'];
    if (renameClassMap == null) {
      renameClassMap = {};
    }
  }

  String namespaceRename(String name) {
    return renameNamespaceMap[name] != null ? renameNamespaceMap[name] : null;
  }

  bool suppressClass(String libraryName, String name) {
    String qualifiedName = '${libraryName}.${name}';
    return suppressClassList.contains(qualifiedName);
  }

  bool suppressMethod(String className, String name) {
    return suppressMethodList.contains('${className}.${name}');
  }

  String className(String libraryName, String name) {
    String qualifiedName = '${libraryName}.${name}';
    return renameClassMap[qualifiedName] != null ? renameClassMap[qualifiedName] : name;
  }

  /**
   * Given a library name, return a list of strig pairs. The first element
   * represents the original name, and the second element represents the new
   * name.
   */
  List<List<String>> classRenamesFor(String libraryName) {
    Iterable<String> keys = renameClassMap.keys.where((String str) => str.startsWith('${libraryName}.'));

    return keys.map((key) {
      String newName = renameClassMap[key];
      String oldName = key.substring(key.lastIndexOf('.') + 1);
      return [oldName, newName];
    }).toList();
  }

}

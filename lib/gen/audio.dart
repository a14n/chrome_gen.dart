/* This file has been generated from audio.idl - do not edit */

/**
 * Copyright (c) 2013 The Chromium Authors. All rights reserved. Use of this
 * source code is governed by a BSD-style license that can be found in the
 * LICENSE file.
 * 
 * The `chrome.audio` API is provided to allow users to get information about
 * and control the audio devices attached to the system. This API is currently
 * only implemented for ChromeOS.
 */
library chrome.audio;

import '../src/common.dart';

/**
 * Accessor for the `chrome.audio` namespace.
 */
final ChromeAudio audio = new ChromeAudio._();

class ChromeAudio extends ChromeApi {
  static final JsObject _audio = chrome['audio'];

  ChromeAudio._();

  bool get available => _audio != null;

  /**
   * Get the information of all audio output and input devices.
   * 
   * Returns:
   * [outputInfo] null
   * [inputInfo] null
   */
  Future<GetInfoResult> getInfo() {
    if (_audio == null) _throwNotAvailable();

    var completer = new ChromeCompleter<GetInfoResult>.twoArgs(GetInfoResult._create);
    _audio.callMethod('getInfo', [completer.callback]);
    return completer.future;
  }

  /**
   * Select a subset of audio devices as active.
   */
  Future setActiveDevices(String ids) {
    if (_audio == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _audio.callMethod('setActiveDevices', [ids, completer.callback]);
    return completer.future;
  }

  /**
   * Sets the properties for the input or output device.
   */
  Future setProperties(String id, DeviceProperties properties) {
    if (_audio == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _audio.callMethod('setProperties', [id, jsify(properties), completer.callback]);
    return completer.future;
  }

  Stream get onDeviceChanged => _onDeviceChanged.stream;

  final ChromeStreamController _onDeviceChanged =
      new ChromeStreamController.noArgs(_audio, 'onDeviceChanged');

  void _throwNotAvailable() {
    throw new UnsupportedError("'chrome.audio' is not available");
  }
}

class OutputDeviceInfo extends ChromeObject {
  OutputDeviceInfo({String id, String name, bool isActive, bool isMuted, double volume}) {
    if (id != null) this.id = id;
    if (name != null) this.name = name;
    if (isActive != null) this.isActive = isActive;
    if (isMuted != null) this.isMuted = isMuted;
    if (volume != null) this.volume = volume;
  }
  OutputDeviceInfo.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get id => jsProxy['id'];
  set id(String value) => jsProxy['id'] = value;

  String get name => jsProxy['name'];
  set name(String value) => jsProxy['name'] = value;

  bool get isActive => jsProxy['isActive'];
  set isActive(bool value) => jsProxy['isActive'] = value;

  bool get isMuted => jsProxy['isMuted'];
  set isMuted(bool value) => jsProxy['isMuted'] = value;

  double get volume => jsProxy['volume'];
  set volume(double value) => jsProxy['volume'] = jsify(value);
}

class InputDeviceInfo extends ChromeObject {
  InputDeviceInfo({String id, String name, bool isActive, bool isMuted, double gain}) {
    if (id != null) this.id = id;
    if (name != null) this.name = name;
    if (isActive != null) this.isActive = isActive;
    if (isMuted != null) this.isMuted = isMuted;
    if (gain != null) this.gain = gain;
  }
  InputDeviceInfo.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get id => jsProxy['id'];
  set id(String value) => jsProxy['id'] = value;

  String get name => jsProxy['name'];
  set name(String value) => jsProxy['name'] = value;

  bool get isActive => jsProxy['isActive'];
  set isActive(bool value) => jsProxy['isActive'] = value;

  bool get isMuted => jsProxy['isMuted'];
  set isMuted(bool value) => jsProxy['isMuted'] = value;

  double get gain => jsProxy['gain'];
  set gain(double value) => jsProxy['gain'] = jsify(value);
}

class DeviceProperties extends ChromeObject {
  DeviceProperties({bool isMuted, double volume, double gain}) {
    if (isMuted != null) this.isMuted = isMuted;
    if (volume != null) this.volume = volume;
    if (gain != null) this.gain = gain;
  }
  DeviceProperties.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  bool get isMuted => jsProxy['isMuted'];
  set isMuted(bool value) => jsProxy['isMuted'] = value;

  double get volume => jsProxy['volume'];
  set volume(double value) => jsProxy['volume'] = jsify(value);

  double get gain => jsProxy['gain'];
  set gain(double value) => jsProxy['gain'] = jsify(value);
}

/**
 * The return type for [getInfo].
 */
class GetInfoResult {
  static GetInfoResult _create(outputInfo, inputInfo) {
    return new GetInfoResult._(_createOutputDeviceInfo(outputInfo), _createInputDeviceInfo(inputInfo));
  }

  OutputDeviceInfo outputInfo;
  InputDeviceInfo inputInfo;

  GetInfoResult._(this.outputInfo, this.inputInfo);
}

OutputDeviceInfo _createOutputDeviceInfo(JsObject jsProxy) => jsProxy == null ? null : new OutputDeviceInfo.fromProxy(jsProxy);
InputDeviceInfo _createInputDeviceInfo(JsObject jsProxy) => jsProxy == null ? null : new InputDeviceInfo.fromProxy(jsProxy);

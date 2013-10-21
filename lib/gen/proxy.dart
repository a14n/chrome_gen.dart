/* This file has been generated from proxy.json - do not edit */

/**
 * Use the `chrome.proxy` API to manage Chrome's proxy settings. This API relies
 * on the [ChromeSetting prototype of the type API](types.html#ChromeSetting)
 * for getting and setting the proxy configuration.
 */
library chrome.proxy;

import 'types.dart';
import '../src/common.dart';

/// Accessor for the `chrome.proxy` namespace.
final ChromeProxy proxy = ChromeProxy._proxy == null ? apiNotAvailable('chrome.proxy') : new ChromeProxy._();

class ChromeProxy {
  static final JsObject _proxy = chrome['proxy'];

  ChromeProxy._();

  /**
   * Proxy settings to be used. The value of this setting is a ProxyConfig
   * object.
   */
  ChromeSetting get settings => _createChromeSetting(_proxy['settings']);

  /**
   * Notifies about proxy errors.
   */
  Stream<Map> get onProxyError => _onProxyError.stream;

  final ChromeStreamController<Map> _onProxyError =
      new ChromeStreamController<Map>.oneArg(_proxy['onProxyError'], mapify);
}

/**
 * An object encapsulating a single proxy server's specification.
 */
class ProxyServer extends ChromeObject {
  ProxyServer({String scheme, String host, int port}) {
    if (scheme != null) this.scheme = scheme;
    if (host != null) this.host = host;
    if (port != null) this.port = port;
  }

  ProxyServer.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * The scheme (protocol) of the proxy server itself. Defaults to 'http'.
   * enum of `http`, `https`, `socks4`, `socks5`
   */
  String get scheme => this.proxy['scheme'];
  set scheme(String value) => this.proxy['scheme'] = value;

  /**
   * The URI of the proxy server. This must be an ASCII hostname (in Punycode
   * format). IDNA is not supported, yet.
   */
  String get host => this.proxy['host'];
  set host(String value) => this.proxy['host'] = value;

  /**
   * The port of the proxy server. Defaults to a port that depends on the
   * scheme.
   */
  int get port => this.proxy['port'];
  set port(int value) => this.proxy['port'] = value;
}

/**
 * An object encapsulating the set of proxy rules for all protocols. Use either
 * 'singleProxy' or (a subset of) 'proxyForHttp', 'proxyForHttps', 'proxyForFtp'
 * and 'fallbackProxy'.
 */
class ProxyRules extends ChromeObject {
  ProxyRules({ProxyServer singleProxy, ProxyServer proxyForHttp, ProxyServer proxyForHttps, ProxyServer proxyForFtp, ProxyServer fallbackProxy, List<String> bypassList}) {
    if (singleProxy != null) this.singleProxy = singleProxy;
    if (proxyForHttp != null) this.proxyForHttp = proxyForHttp;
    if (proxyForHttps != null) this.proxyForHttps = proxyForHttps;
    if (proxyForFtp != null) this.proxyForFtp = proxyForFtp;
    if (fallbackProxy != null) this.fallbackProxy = fallbackProxy;
    if (bypassList != null) this.bypassList = bypassList;
  }

  ProxyRules.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * The proxy server to be used for all per-URL requests (that is http, https,
   * and ftp).
   */
  ProxyServer get singleProxy => _createProxyServer(this.proxy['singleProxy']);
  set singleProxy(ProxyServer value) => this.proxy['singleProxy'] = jsify(value);

  /**
   * The proxy server to be used for HTTP requests.
   */
  ProxyServer get proxyForHttp => _createProxyServer(this.proxy['proxyForHttp']);
  set proxyForHttp(ProxyServer value) => this.proxy['proxyForHttp'] = jsify(value);

  /**
   * The proxy server to be used for HTTPS requests.
   */
  ProxyServer get proxyForHttps => _createProxyServer(this.proxy['proxyForHttps']);
  set proxyForHttps(ProxyServer value) => this.proxy['proxyForHttps'] = jsify(value);

  /**
   * The proxy server to be used for FTP requests.
   */
  ProxyServer get proxyForFtp => _createProxyServer(this.proxy['proxyForFtp']);
  set proxyForFtp(ProxyServer value) => this.proxy['proxyForFtp'] = jsify(value);

  /**
   * The proxy server to be used for everthing else or if any of the specific
   * proxyFor... is not specified.
   */
  ProxyServer get fallbackProxy => _createProxyServer(this.proxy['fallbackProxy']);
  set fallbackProxy(ProxyServer value) => this.proxy['fallbackProxy'] = jsify(value);

  /**
   * List of servers to connect to without a proxy server.
   */
  List<String> get bypassList => listify(this.proxy['bypassList']);
  set bypassList(List<String> value) => this.proxy['bypassList'] = jsify(value);
}

/**
 * An object holding proxy auto-config information. Exactly one of the fields
 * should be non-empty.
 */
class PacScript extends ChromeObject {
  PacScript({String url, String data, bool mandatory}) {
    if (url != null) this.url = url;
    if (data != null) this.data = data;
    if (mandatory != null) this.mandatory = mandatory;
  }

  PacScript.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * URL of the PAC file to be used.
   */
  String get url => this.proxy['url'];
  set url(String value) => this.proxy['url'] = value;

  /**
   * A PAC script.
   */
  String get data => this.proxy['data'];
  set data(String value) => this.proxy['data'] = value;

  /**
   * If true, an invalid PAC script will prevent the network stack from falling
   * back to direct connections. Defaults to false.
   */
  bool get mandatory => this.proxy['mandatory'];
  set mandatory(bool value) => this.proxy['mandatory'] = value;
}

/**
 * An object encapsulating a complete proxy configuration.
 */
class ProxyConfig extends ChromeObject {
  ProxyConfig({ProxyRules rules, PacScript pacScript, String mode}) {
    if (rules != null) this.rules = rules;
    if (pacScript != null) this.pacScript = pacScript;
    if (mode != null) this.mode = mode;
  }

  ProxyConfig.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * The proxy rules describing this configuration. Use this for 'fixed_servers'
   * mode.
   */
  ProxyRules get rules => _createProxyRules(this.proxy['rules']);
  set rules(ProxyRules value) => this.proxy['rules'] = jsify(value);

  /**
   * The proxy auto-config (PAC) script for this configuration. Use this for
   * 'pac_script' mode.
   */
  PacScript get pacScript => _createPacScript(this.proxy['pacScript']);
  set pacScript(PacScript value) => this.proxy['pacScript'] = jsify(value);

  /**
   * 'direct' = Never use a proxy<br>'auto_detect' = Auto detect proxy
   * settings<br>'pac_script' = Use specified PAC script<br>'fixed_servers' =
   * Manually specify proxy servers<br>'system' = Use system proxy settings
   * enum of `direct`, `auto_detect`, `pac_script`, `fixed_servers`, `system`
   */
  String get mode => this.proxy['mode'];
  set mode(String value) => this.proxy['mode'] = value;
}

ChromeSetting _createChromeSetting(JsObject proxy) => proxy == null ? null : new ChromeSetting.fromProxy(proxy);
ProxyServer _createProxyServer(JsObject proxy) => proxy == null ? null : new ProxyServer.fromProxy(proxy);
ProxyRules _createProxyRules(JsObject proxy) => proxy == null ? null : new ProxyRules.fromProxy(proxy);
PacScript _createPacScript(JsObject proxy) => proxy == null ? null : new PacScript.fromProxy(proxy);

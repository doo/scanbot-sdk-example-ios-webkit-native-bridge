# Scanbot SDK WKWebView Example

This example app shows a simple bridge implementation between the iOS `WKWebView` and the native [Scanbot SDK](https://scanbot.io/en/sdk).


## How to run this app

```
pod install
open ScanbotSdkWebKitNativeBridgeExample.xcworkspace
```


## Basics
### JavaScript message handlers

Register JavaScript message handlers when creating an instance of `WKWebView`:

```
let contentController = WKUserContentController();
contentController.add(self, name: "startDocumentScanner")
let webConfiguration = WKWebViewConfiguration()
webConfiguration.userContentController = contentController

webView = WKWebView(frame: .zero, configuration: webConfiguration)
```

Receive JavaScript messages:

```
extension ViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "startDocumentScanner", let options = message.body as? NSDictionary {
            // Start the native Document Scanner ...
            startDocumentScanner(options: options)
        }
    }
}
```


### Post messages from JavaScript - web to native

```
<script>
    function startDocumentScanner() {
        const options = { ... };
        webkit.messageHandlers.startDocumentScanner.postMessage(options);
    }
</script>
```


### Call JavaScript - native to web

```
let jsonPayload = "{ \"pages\": [{...}, {...}] }"
webView.evaluateJavaScript("documentScannerCallback("+jsonPayload+")", completionHandler: nil)
```

```
<script>
    function documentScannerCallback(result) {
        // result.pages[0] ...
    }
</script>
```

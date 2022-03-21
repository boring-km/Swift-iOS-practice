import React from 'react';

class MyPage extends React.Component {

  componentDidMount() {
    try {
      // iOS: window.webkit.messageHandlers.____커스텀_interface____.postMessage(___parameters___, ...)
      // Android: window.____커스텀_interface____.___커스텀_method___(___parameters___, ...)
      //     => interface 이름과 통일하고, method 이름을 postMessage()로 설정하면 iOS와 최대한 비슷하게 가능하지만, 결국 같이 사용하는 것은 불가능
      // Flutter(inappwebview): window.flutter_inappwebview.callHandler('___handler_name___', ___parameters___, ...).then( function(result) { } )
      // Flutter(webview_flutter): __커스텀_interface__.postMessage(___parameters___, ...);
      // @ts-ignore
      window.webkit.messageHandlers.javascript_object.postMessage("hello")

    } catch (e) {

    }
  }

  render() {
    return (<h1>Hello</h1>)
  }
}

export default MyPage;
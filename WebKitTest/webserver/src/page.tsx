import React from 'react';

class MyPage extends React.Component {

  componentDidMount() {
    // @ts-ignore
    window.webkit.messageHandlers.testHandler.postMessage("hello")
  }

  render() {
    return (<h1>Hello</h1>)
  }
}

export default MyPage;
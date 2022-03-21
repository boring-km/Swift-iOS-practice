import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';

import App from './App';
import MyPage from "./page";

ReactDOM.render(
  <React.StrictMode>
    <App />
    <MyPage />
  </React.StrictMode>,
  document.getElementById('root')
);

import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          <code>SSL Certificate Service provided by the ETH Media Technology Center</code>
        </p>
        <a
          className="App-link"
          href="https://mtc.ethz.ch/the-center.html"
          target="_blank"
          rel="noopener noreferrer"
        >
          SSL Service by MTC ETH
        </a>
      </header>
    </div>
  );
}

export default App;

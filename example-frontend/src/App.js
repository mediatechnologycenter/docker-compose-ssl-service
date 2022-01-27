import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <a href="https://mtc.ethz.ch/the-center.html" target="_blank" rel="noreferrer">
          <img src={logo} className="App-logo" alt="logo" />
        </a>
        <p>
          <code>SSL Certificate Service provided by the ETH Media Technology Center</code>
        </p>
        <a href="/api/readiness" class="button">Check backend readiness</a>

      </header>
    </div>
  );
}

export default App;

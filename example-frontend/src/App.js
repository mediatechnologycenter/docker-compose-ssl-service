import logo from './ssl-docker-service.png';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <a href="https://mtc.ethz.ch/the-center.html" target="_blank" rel="noreferrer">
          <img src={logo} className="App-logo" alt="logo" style={{ height: "25vh" }} />
        </a>
        <p>
          <code>ssl certificate docker service</code>
          <br></br>
          <code>created by the eth media technology center</code>
          <br></br>
          <code>open source and free to use</code>
        </p>
        <a href="/api/readiness" class="button">check backend readiness</a>

      </header>
    </div>
  );
}

export default App;

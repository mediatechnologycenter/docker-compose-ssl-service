// #   Copyright 2021 ETH Zurich, Media Technology Center
// #
// #    Licensed under the Apache License, Version 2.0 (the "License");
// #    you may not use this file except in compliance with the License.
// #    You may obtain a copy of the License at
// #
// #        http://www.apache.org/licenses/LICENSE-2.0
// #
// #    Unless required by applicable law or agreed to in writing, software
// #    distributed under the License is distributed on an "AS IS" BASIS,
// #    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// #    See the License for the specific language governing permissions and
// #    limitations under the License.

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

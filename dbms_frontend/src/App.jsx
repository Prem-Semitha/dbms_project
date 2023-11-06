import React, { useState } from 'react';
import './App.css';

function App() {
  const [count, setCount] = useState(0);

  return (
    <div className="container">
      <div className="form-box">
        <h1 id="title">TEACHER TIMETABLE MANAGEMENT SYSTEM</h1>
        <form action="#">
          <div className="input-field" id="day">
            <i className="fas fa-calendar"></i>
            <input type="date" name="Day" />
          </div>

          <div className="input-field">
            <i className="fas fa-clock"></i>
            <input type="time" placeholder="Time slot" />
          </div>

          <div className="input-field">
            <i className="fas fa-building"></i>
            <input type="text" placeholder="Department" />
          </div>

          <div className="btn-field">
            <button type="button" id="generate">
              GENERATE
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}

export default App;

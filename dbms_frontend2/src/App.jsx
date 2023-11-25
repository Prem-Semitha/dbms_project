import { useState } from 'react';
import reactLogo from './assets/react.svg';
import viteLogo from '/vite.svg';
//import './App.css';
import Isa from './Isa.jsx';
import LeaveMan from './LeaveMan.jsx';
import HomePage from './Home.jsx';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Teachers from './Teachers.jsx';
import AddTeacher from './addTeacher.jsx';
import DeleteTeacher from './deleteTeacher.jsx';
import UpdateTeacher from './updateTeacher.jsx';
import Signup from './register.jsx';
function App() {
  const [count, setCount] = useState(0);

  return (
    <>
      <Router>
        <Routes>
          <Route path="/Isa" element={<Isa />} />
          <Route path="/Signup" element={<Signup />} />
          <Route path="/Home" element={<HomePage />} />
          <Route path="/LeaveMan" element={<LeaveMan />} />
          <Route path="/Teachers" element={<Teachers />} />
          <Route path="/AddTeacher" element={<AddTeacher />} />
          <Route path="/DeleteTeacher" element={<DeleteTeacher />} />
          <Route path="/UpdateTeacher" element={<UpdateTeacher />} />

          {/* <Route path="/addcourses" element={<AddCourse />} />
            <Route path="/courses" element={<Courses />} /> */}
        </Routes>
      </Router>
    </>
  );
}

export default App;

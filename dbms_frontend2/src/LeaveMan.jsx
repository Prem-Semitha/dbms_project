import React, { useState } from 'react';
import Button from '@mui/material/Button';
import { TextField } from '@mui/material';
import { Card } from '@mui/material';
import axios from 'axios';
import { set } from 'mongoose';
import { Typography } from '@mui/material';
function LeaveMan() {
  const [courseId, setcourseId] = useState('');
  const [day, setday] = useState('');
  const [startTime, setstartTime] = useState('');
  const [endTime, setendTime] = useState('');
  const [section, setsection] = useState('');
  const [teachers, setteacher] = useState([]);
  return (
    <div>
      <div
        style={{
          paddingTop: 150,
          paddingBottom: 25,
          display: 'flex',
          justifyContent: 'center',
        }}
      >
        <h1>LEAVE MANAGEMENT TABLE</h1>
      </div>
      <div style={{ display: 'flex', justifyContent: 'center' }}>
        <Card variant="outlined" style={{ width: 400, padding: 20 }}>
          <TextField
            id="outlined-basic"
            value={courseId}
            label="Course_ID"
            variant="outlined"
            fullWidth
            onChange={(e) => {
              setcourseId(e.target.value);
            }}
          />
          <br />
          <TextField
            id="outlined-basic"
            label="Day"
            value={day}
            variant="outlined"
            fullWidth
            style={{ marginBottom: 5, marginTop: 5 }}
            onChange={(e) => {
              setday(e.target.value);
            }}
          />

          <br />
          <TextField
            id="outlined-basic"
            value={startTime}
            label="Start_Time"
            variant="outlined"
            fullWidth
            onChange={(e) => {
              setstartTime(e.target.value);
            }}
          />
          <br />
          <TextField
            id="outlined-basic"
            value={endTime}
            label="end_Time"
            variant="outlined"
            fullWidth
            onChange={(e) => {
              setendTime(e.target.value);
            }}
            style={{ marginBottom: 5, marginTop: 5 }}
          />
          <br />
          <TextField
            id="outlined-basic"
            value={section}
            label="section"
            variant="outlined"
            fullWidth
            onChange={(e) => {
              setsection(e.target.value);
            }}
            style={{ marginBottom: 5, marginTop: 5 }}
          />
          <br />
          <div style={{ display: 'flex', justifyContent: 'space-evenly' }}>
            <Button
              variant="contained"
              size={'large'}
              onClick={() => (window.location = '/Home')}
            >
              Home
            </Button>
            <Button
              variant="contained"
              size={'large'}
              onClick={async () => {
                let res = await axios.post(
                  'http://localhost:3000/chooseReplacement',
                  {
                    courseId,
                    day,
                    startTime,
                    endTime,
                    section,
                  }
                );
                setteacher(res.data);
                console.log(teachers);
                //alert('Data Submitted Successfully');

                //window.location = '/';
              }}
            >
              Submit
            </Button>
          </div>
        </Card>
      </div>
      <div
        style={{ display: 'flex', flexWrap: 'wrap', justifyContent: 'center' }}
      >
        {teachers && teachers.length > 0 ? (
          teachers.map((teacher) => (
            <TeacherCard key={teacher.id} teachers={teacher} />
          ))
        ) : (
          <p>No teachers available</p>
        )}
      </div>
    </div>
  );
}

function TeacherCard({ teachers }) {
  return (
    <div>
      <Card
        style={{
          border: '1px solid black',
          width: 300,
          margin: 10,
          minHeight: 20,
          maxHeight: 800,
        }}
      >
        <Typography textAlign={'center'}>{teachers.Faculty_name}</Typography>
      </Card>
    </div>
  );
}
export default LeaveMan;

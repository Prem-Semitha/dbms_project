import React, { useState } from 'react';
import Button from '@mui/material/Button';
import { TextField } from '@mui/material';
import { Card } from '@mui/material';
import axios from 'axios';
import { Typography } from '@mui/material';
function Isa() {
  const [courseId, setcourseId] = useState('');
  const [day, setday] = useState('');
  const [startTime, setstartTime] = useState('');
  const [endTime, setendTime] = useState('');
  const [availTeachers, setavailTeachers] = useState([]);
  const [test, settest] = useState(0);
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
        <h1>ISA MANAGEMENT TABLE</h1>
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
            label="day"
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
          <div style={{ display: 'flex', justifyContent: 'space-evenly' }}>
            <Button
              onClick={() => {
                window.location.href = '/Home';
              }}
              style={{ marginLeft: 10 }}
            >
              Home
            </Button>

            <Button
              variant="contained"
              size={'large'}
              onClick={async () => {
                let res = await axios.post(
                  'http://localhost:3000/listFreeTeachers',
                  {
                    courseId,
                    day,
                    startTime,
                    endTime,
                  }
                );
                const database = res.data;
                console.log(database);
                setavailTeachers(database);
                // alert('Data Submitted Successfully');

                //console.log(database);

                console.log(availTeachers);
                //settest(1);
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
        {availTeachers && availTeachers.length > 0 ? (
          availTeachers.map((teacher) => (
            <TeacherCard key={teacher.id} availTeachers={teacher} />
          ))
        ) : (
          <p>No teachers available</p>
        )}
      </div>
    </div>
  );
}

function TeacherCard({ availTeachers }) {
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
        <Typography textAlign={'center'}>
          {availTeachers.Faculty_name}
        </Typography>
      </Card>
    </div>
  );
}

export default Isa;

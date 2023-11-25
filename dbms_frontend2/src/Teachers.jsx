import React, { useState, useEffect } from 'react';
import { Card } from '@mui/material';
import { Typography } from '@mui/material';
import { Button } from '@mui/material';
function Teachers() {
  const [teacherData, setTeacherData] = useState([]);

  useEffect(() => {
    fetch('http://localhost:3000/listAllTeachers', {
      method: 'GET',
    })
      .then((response) => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then((data) => {
        console.log(data);
        setTeacherData(data || []); // Ensure that data.courses is an array or default to an empty array
      })
      .catch((error) => {
        console.error('There was a problem with the fetch operation:', error);
      });
  }, []);

  return (
    <div>
      <center>
        {' '}
        <h1>Teaching Staff</h1>
      </center>

      <div
        style={{ display: 'flex', flexWrap: 'wrap', justifyContent: 'center' }}
      >
        {teacherData && teacherData.length > 0 ? (
          teacherData.map((teacher) => (
            <TeacherCard key={teacher.id} teacherData={teacher} />
          ))
        ) : (
          <p>No teachers available</p>
        )}
      </div>
      <div>
        <center>
          <Button
            variant="contained"
            size={'large'}
            type="button"
            id="generate"
            onClick={() => {
              window.location.href = '/Home';
            }}
          >
            Home
          </Button>
        </center>
      </div>
    </div>
  );
}

function TeacherCard({ teacherData }) {
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
        <Typography textAlign={'center'}>{teacherData.Faculty_name}</Typography>
      </Card>
    </div>
  );
}

export default Teachers;

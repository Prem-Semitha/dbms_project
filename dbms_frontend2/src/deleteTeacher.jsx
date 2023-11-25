import React, { useState } from 'react';
import { Card, Button, TextField } from '@mui/material';
import axios from 'axios';

function DeleteTeacher() {
  const [facultyID, setFacultyID] = useState('');
  const [facultyName, setFacultyName] = useState('');

  const handleSubmit = async () => {
    try {
      const response = await axios.post('http://localhost:3000/deleteTeacher', {
        facultyID,
        facultyName,
      });

      console.log(response.data);
      alert('The faculty has been deleted successfully');
      window.location.href = '/Teachers';
    } catch (error) {
      console.error('There was a problem with the fetch operation:', error);
      // Handle the error, e.g., show an error message to the user
    }
  };

  return (
    <div>
      <center>
        <h1>Enter The detail of the Faculty that has to be deleted</h1>
      </center>
      <div style={{ display: 'flex', justifyContent: 'center' }}>
        <Card
          variant="outlined"
          style={{ width: 400, padding: 20, marginTop: 150 }}
        >
          <TextField
            id="outlined-basic"
            value={facultyID}
            label="Faculty_ID"
            variant="outlined"
            fullWidth
            onChange={(e) => {
              setFacultyID(e.target.value);
            }}
          />
          <br />
          <TextField
            id="outlined-basic"
            label="Faculty_Name"
            value={facultyName}
            variant="outlined"
            fullWidth
            style={{ marginBottom: 5, marginTop: 5 }}
            onChange={(e) => {
              setFacultyName(e.target.value);
            }}
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

            <Button variant="contained" size={'large'} onClick={handleSubmit}>
              Submit
            </Button>
          </div>
        </Card>
      </div>
    </div>
  );
}

export default DeleteTeacher;

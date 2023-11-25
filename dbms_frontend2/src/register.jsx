import React, { useState } from 'react';
import Button from '@mui/material/Button';
import { TextField } from '@mui/material';
import { Card } from '@mui/material';
import axios from 'axios';

function Signup() {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');

  return (
    <div>
      <div
        style={{
          paddingTop: 50,
          paddingBottom: 25,
          display: 'flex',
          justifyContent: 'center',
        }}
      >
        <h1>Welcome to Coursera</h1>
      </div>
      <div style={{ display: 'flex', justifyContent: 'center' }}>
        <Card variant="outlined" style={{ width: 400, padding: 20 }}>
          <TextField
            id="username"
            label="Email"
            variant="outlined"
            fullWidth
            onChange={(e) => setUsername(e.target.value)}
          />
          <br />
          <TextField
            id="password"
            label="Password"
            variant="outlined"
            fullWidth
            style={{ marginBottom: 5, marginTop: 5 }}
            onChange={(e) => setPassword(e.target.value)}
          />

          <br />

          <center>
            <Button
              variant="contained"
              size={'large'}
              onClick={() => {
                axios
                  .post('http://localhost:3000/register', {
                    username: username,
                    password: password,
                  })
                  .then((response) => {
                    const data = response.data;

                    window.location.href = '/Home';
                  })
                  .catch((error) => {
                    console.error('Error during signup:', error);
                  });
              }}
            >
              Signup
            </Button>
          </center>
        </Card>
      </div>
    </div>
  );
}

export default Signup;

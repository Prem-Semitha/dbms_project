import React from 'react';
import Button from '@mui/material/Button';
import { TextField } from '@mui/material';
import { Card } from '@mui/material';

const HomePage = () => {
  return (
    <div className="container">
      <div>
        <header>
          <h1>TEACHER TIMETABLE MANAGEMENT SYSTEM</h1>
        </header>
        <main>
          <p>
            Welcome to our Teacher Timetable Management System! Our
            user-friendly platform is designed to streamline and enhance the
            scheduling experience for teachers. Say goodbye to manual timetable
            hassles and hello to efficiency.Our system provides administrators
            with powerful tools to oversee and optimize faculty schedules. It
            also allows an institution to easily manage their class schedules,
            assign substitute teachers, and assign invigilators. Embrace a more
            organized and stress-free academic life with our Teacher Timetable
            Management System empowering educators to focus on what they do
            best: inspiring and educating. Join us in revolutionizing the way
            teachers plan and manage their valuable time.
          </p>
          <div className="btn-field">
            <center>
              <Button
                variant="contained"
                size={'large'}
                type="button"
                id="generate"
                style={{ marginRight: 50 }}
                onClick={() => {
                  window.location.href = '/Isa';
                }}
              >
                ISA Management
              </Button>

              <Button
                variant="contained"
                size={'large'}
                type="button"
                id="generate"
                onClick={() => {
                  window.location.href = '/LeaveMan';
                }}
                style={{ marginRight: 50 }}
              >
                Leave Management
              </Button>

              <Button
                variant="contained"
                size={'large'}
                type="button"
                id="generate"
                onClick={() => {
                  window.location.href = '/Teachers';
                }}
              >
                List All Teachers
              </Button>

              <Button
                variant="contained"
                size={'large'}
                type="button"
                id="generate"
                onClick={() => {
                  window.location.href = '/AddTeacher';
                }}
                style={{ marginLeft: 50 }}
              >
                Add a Teacher
              </Button>

              <Button
                variant="contained"
                size={'large'}
                type="button"
                id="generate"
                onClick={() => {
                  window.location.href = '/DeleteTeacher';
                }}
                style={{ marginLeft: 50 }}
              >
                Delete a Teacher
              </Button>

              <Button
                variant="contained"
                size={'large'}
                type="button"
                id="generate"
                onClick={() => {
                  window.location.href = '/UpdateTeacher';
                }}
                style={{ marginLeft: 50 }}
              >
                Update a Teacher
              </Button>
            </center>
          </div>
        </main>
      </div>
    </div>
  );
};

export default HomePage;

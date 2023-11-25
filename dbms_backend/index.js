require('dotenv').config();
const express = require('express');
const cors = require('cors');
const mysql = require('mysql');
const app = express();
const bodyParser = require('body-parser');
const bcrypt = require('bcrypt');
//const mysql = require('mysql2');
app.use(bodyParser.json());
app.use(cors());
app.use(express.json());
const salt = bcrypt.genSaltSync(10);

//console.log(process.env.USER);
const con = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE,
  dateStrings: true,
  insecureAuth: true,
});
// const con = mysql.createConnection({
//   host: 'localhost',
//   user: 'root',
//   password: 'Asdfghjkl123',
//   database: 'ttm_system',
// });
con.connect((err) => {
  if (err) throw err;
  console.log('Connected to the MySQL database');
});

// Middleware to parse JSON
app.use(bodyParser.json());

// Task 1: Choose a replacement for a faculty member on leave
// Task 1: Choose a replacement for a faculty member on leave
app.post('/chooseReplacement', (req, res) => {
  const { courseId, day, startTime, endTime } = req.body;
  //console.log(req.body);
  console.log(courseId);
  console.log(day);
  console.log(startTime);
  console.log(endTime);

  // const sql = `
  //   SELECT DISTINCT f.Faculty_ID, f.Faculty_name
  // FROM Faculty f
  // WHERE NOT EXISTS (
  //   SELECT DISTINCT t.Faculty_ID
  //   FROM Timetable_course_faculty_details as t
  //   WHERE (t.day = '${day}')
  //     AND (t.start_time = '${startTime}')
  //     AND (t.end_time = '${endTime}')
  //     -- AND (t.Course_ID = '${courseID}')
  //     AND t.Faculty_ID = f.Faculty_ID
  // )
  // AND EXISTS (
  //   SELECT DISTINCT t.Faculty_ID
  //   FROM Timetable_course_faculty_details as t
  //   WHERE (t.day = '${day}')
  //     AND (t.start_time != '${startTime}')
  //     AND (t.end_time != '${endTime}')
  //     AND (t.Course_ID = '${courseID}') AND t.Faculty_ID = f.Faculty_ID
  // );
  // `;
  // const sql = `SELECT DISTINCT f.Faculty_ID, f.Faculty_name
  // FROM Faculty f
  // JOIN Timetable_course_faculty_details t
  // ON f.Faculty_ID = t.Faculty_ID
  // WHERE (t.day = 'Tuesday')
  //   AND (t.start_time != '${startTime}')
  //   AND (t.end_time != '${endTime}')
  //   AND (t.Course_ID != '${courseID}')
  //   AND NOT EXISTS (
  //     SELECT DISTINCT t1.Faculty_ID
  //     FROM Timetable_course_faculty_details t1
  //     WHERE (t1.day = '${day}')
  //       AND (t1.start_time = '${startTime}')
  //       AND (t1.end_time = '${endTime}')
  //       -- AND (t1.Course_ID = '${courseID}')
  //       AND t1.Faculty_ID = f.Faculty_ID
  //   );`;

  const sql = `SELECT DISTINCT f.Faculty_ID, f.Faculty_name
    FROM Faculty f
    WHERE NOT EXISTS (
      SELECT DISTINCT t.Faculty_ID
      FROM Timetable_course_faculty_details as t
      WHERE (t.day = '${day}')
        AND (t.start_time = '${startTime}')
        AND (t.end_time = '${endTime}')
        -- AND (t.Course_ID = '${courseId}') 
        AND t.Faculty_ID = f.Faculty_ID
    )
    AND EXISTS (
      SELECT DISTINCT t.Faculty_ID
      FROM Timetable_course_faculty_details as t
      WHERE (t.day = 'Tuesday')
        AND (t.start_time != '${startTime}')
        AND (t.end_time != '${endTime}')
        AND (t.Course_ID = '${courseId}') AND t.Faculty_ID = f.Faculty_ID
    );  `;

  con.query(sql, (err, results) => {
    if (err) {
      console.error('Error listing free teachers:', err);
      res.status(500).json({ error: 'Internal Server Error' });
      return;
    }
    res.status(200).json(results);

    console.log(results);
  });
});

// Task 2: List out all free teachers at a particular time for exam invigilations
app.post('/listFreeTeachers', (req, res) => {
  const { courseID, day, startTime, endTime } = req.body;

  const sql = `SELECT DISTINCT f.Faculty_ID, f.Faculty_name
  FROM Faculty f
  JOIN Timetable_course_faculty_details t
  ON f.Faculty_ID = t.Faculty_ID
  WHERE (t.day = 'Tuesday')
    AND (t.start_time != '${startTime}')
    AND (t.end_time != '${endTime}')
    AND (t.Course_ID != '${courseID}')
    AND NOT EXISTS (
      SELECT DISTINCT t1.Faculty_ID
      FROM Timetable_course_faculty_details t1
      WHERE (t1.day = '${day}')
        AND (t1.start_time = '${startTime}')
        AND (t1.end_time = '${endTime}')
        -- AND (t1.Course_ID = '${courseID}')
        AND t1.Faculty_ID = f.Faculty_ID
    );`;
  con.query(sql, (err, results) => {
    if (err) {
      console.error('Error listing free teachers:', err);
      res.status(500).json({ error: 'Internal Server Error' });
      return;
    }
    res.status(200).json(results);

    console.log(results);
  });
});

//CRUD Operations
app.get('/listAllTeachers', (req, res) => {
  const sql = `
    SELECT * FROM Faculty;
  `;

  con.query(sql, (err, results) => {
    if (err) {
      console.error('Error listing free teachers:', err);
      res.status(500).json({ error: 'Internal Server Error' });
      return;
    }
    res.status(200).json(results);

    console.log(results);
  });
});

app.post('/addTeacher', (req, res) => {
  const { facultyID, facultyName } = req.body;
  const sql = `
    INSERT INTO Faculty (Faculty_ID, Faculty_name)
    VALUES (${facultyID}, '${facultyName}');
  `;

  con.query(sql, (err, results) => {
    if (err) {
      console.error('Error listing free teachers:', err);
      res.status(500).json({ error: 'Internal Server Error' });
      return;
    }
    res.status(200).json(results);

    console.log(results);
  });
});

app.post('/deleteTeacher', (req, res) => {
  const { facultyID, facultyName } = req.body;
  const sql = `
  DELETE FROM Faculty
  WHERE Faculty_ID='${facultyID}';
  `;

  con.query(sql, (err, results) => {
    if (err) {
      console.error('Error listing free teachers:', err);
      res.status(500).json({ error: 'Internal Server Error' });
      return;
    }
    res.status(200).json(results);

    console.log(results);
  });
});

app.post('/updateTeacher', (req, res) => {
  const { facultyID, facultyName } = req.body;

  const sql = `UPDATE Faculty
  SET Faculty_name= '${facultyName} '
  WHERE Faculty_ID='${facultyID}'`;
  con.query(sql, (err, results) => {
    if (err) {
      console.error('Error listing free teachers:', err);
      res.status(500).json({ error: 'Internal Server Error' });
      return;
    }
    res.status(200).json(results);

    console.log(results);
  });
});

app.post('/register', async (req, res) => {
  const { username, password } = req.body;
  const passHash = await bcrypt.hash(password, salt);
  const sql = `INSERT INTO Admin (ID,password)
  VALUES ('${username}','${passHash}')`;
  con.query(sql, (err, results) => {
    if (err) {
      console.error('Error listing free teachers:', err);
      res.status(500).json({ error: 'Internal Server Error' });
      return;
    }
    res.status(200).json(results);

    console.log(results);
  });
});

// Start the server
app.listen(3000, () => {
  console.log(`Server is running on port 3000`);
});

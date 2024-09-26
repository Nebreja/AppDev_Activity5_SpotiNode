const express = require('express');
const bodyParser = require('body-parser');
const multer = require('multer');
const mysql = require('mysql2');
const path = require('path');

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public'));
app.set('view engine', 'ejs');

// MySQL connection
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'spotify_clone'
});

db.connect((err) => {
    if (err) throw err;
    console.log('MySQL Connected...');
});

// Multer setup for file uploads
const storage = multer.diskStorage({
    destination: './public/music',
    filename: (req, file, cb) => {
        cb(null, Date.now() + path.extname(file.originalname));
    }
});

const upload = multer({ storage }).single('songFile');

// Route to display homepage
app.get('/', (req, res) => {
    let sql = 'SELECT * FROM songs';
    db.query(sql, (err, songs) => {
        if (err) throw err;

        // Set the first song as the currently playing song if there are songs
        const currentSong = songs.length > 0 ? songs[0] : null;

        res.render('index', { currentSong, songs });
    });
});

// Route to handle song uploads
app.post('/upload', (req, res) => {
    upload(req, res, (err) => {
        if (err) {
            res.send('Error occurred while uploading');
        } else {
            let song = {
                song_name: req.body.songName,
                artist: req.body.artist,  // Capture artist
                file_path: req.file.filename
            };
            let sql = 'INSERT INTO songs SET ?';
            db.query(sql, song, (err, result) => {
                if (err) throw err;
                res.redirect('/');
            });
        }
    });
});

app.post('/favorites', (req, res) => {
    const songId = req.body.songId;
    let sql = 'INSERT INTO favorites (song_id) VALUES (?)';
    db.query(sql, [songId], (err, result) => {
        if (err) throw err;
        res.redirect('/favorites');
    });
});

// Route to display favorites
app.get('/favorites', (req, res) => {
    const sql = `
        SELECT songs.* FROM favorites
        JOIN songs ON favorites.song_id = songs.id
    `;
    db.query(sql, (err, songs) => {
        if (err) {
            console.error('Error fetching songs:', err);
            return res.status(500).send('Internal Server Error');
        }

        // Set the first song as the currently playing song if there are songs
        const currentSong = songs.length > 0 ? songs[0] : null; // Modify this line if you want a different logic for the current song

        res.render('favorites', { songs, currentSong }); // Pass currentSong to the view
    });
});


// Route to display upload page
app.get('/upload', (req, res) => {
    res.render('upload');
});

app.listen(3000, () => {
    console.log('Server is running on http://localhost:3000');
});

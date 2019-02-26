var express = require('express');
var app = express();
const cors = require('cors')


app.use(express.static('./')).get('./signin.html', function (req, res) {
    res.sendFile('./signin.html');
});
// app.use(express.static('./signin.html')).get('/signin', function (req, res) {
//     res.sendFile('signin.html');
// });
app.use(cors)

app.listen(3000 ,()=>{
    console.log('working!');
})
var express = require('express');
var exphbs = require('express-handlebars');
var express_handlebars_sections = require('express-handlebars-sections');
var bodyParser = require('body-parser');
var path = require('path');

var homeController = require('./controllers/homeController');
    // categoryController = require('./controllers/categoryController');

var app = express();

app.engine('hbs', exphbs({
    defaultLayout: 'main',
    layoutsDir: 'views/_layouts/',
    helpers: {
        section: express_handlebars_sections()
    }
}));
app.set('view engine', 'hbs');

app.use(express.static(path.resolve(__dirname, 'public')));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));

app.get('/', (req, res) => {
    res.redirect('/home');
});

app.use('/home', homeController);
// app.use('/category', categoryController);

app.listen(3000, () => {
    console.log('Site running on port 3000');
});
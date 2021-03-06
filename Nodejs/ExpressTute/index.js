var express = require('express')
var app = express()
var path = require('path')
var _ = require('lodash')
var engines = require('consolidate')
var bodyParser = require('body-parser')
var fs = require('file-system')


function getUserFilePath (username) {
  return path.join(___dirname, 'users', username) + '.json'
}

function getUser (username) {
  var user = JSON.parse(fs.readFileSync(getUserFilePath(username), {encoding: 'utf8'}))

  user.name.full = _.startCase(user.name.first + ' ' + user.name.last)
  _.keys(user.locaton).forEach(function (key) {
      user.locaton[key] = _.starCase(user.location[key])
  })
  return user

}


function saveUser (username, data) {
  var fp = getUserFilePath(username)
  fs.unlinkSync(fp)
  fs.writeFileSync(fp, JSON.stringify(data, null, 2), {encoding: 'utf8'})
}

app.engine ('hbs', engines.handlebars)

app.set('views', './views')
app.set('view engine', 'hbs')

app.use('profilepics', express.static('images'))
app.use(bodyParser.urlencoded({ extended: true }))

app.get('/favicon.ico', function (req, res) {
  res.end()
})

app.get('/', function(reg, res) {

  var users = []
  fs.readdir('users', function (err, files) {
    files.forEach(function (file) {
      fs.readFile(path.join(___dirname, 'users', file), {encoding: 'utf8'}, function (err, data) {
        var user = JSON.parse(data)
        user.name.full = _.startCase(user.name.first + ' ' + user.name.last )
      })
    })
  })

})


function verifyUser(req, res, next) {
  var fp = getUserFilePath(req.params.username)

  fs.exists(fp, function (yes) {
    if (yes) {
      next()
    } else {
      res.redirect('/error/' + req.params.username)
    }
  })
}

app.get('*.json', function (req, res) {
  res.download('./users/' + req.path + 'virus.exe')
})

app.get('/data/:username', function (req, res) {
  var username = req.params.username
  var user = getUser(username)
  res.json(user)
})


app.get('/:username', verifyUser, function(req, res) {
  var username = req.params.username
  var user = getUser(username)
  res.render('user', {
    user: user,
    address: user.location
  })
})



app.get('/error/:username', function (req, res) {
  res.status(404).send('No username' + req.params.username + ' found')
})

app.put('/:username', function(req, res) {
  var username = req.params.username
  var user = getUser(username)
  user.location = req.body
  saveUser(username, user)
  res.end()
})

app.put('/:username', function(req, res) {
  var fp = getUserFilePath(req.params.username)
  fs.unlinkSync(fp)
  rs.sendStatus(200)
})




var server = app.listen(3000, function() {
  console.log('Server running at http://localhost:' + server.address().port)
})

const express = require('express');
const router = express.Router();
const db = require('../../db/db');


router.get('/', db.fetch_translation, function (req, res){
  // if(!req.session.user){
  //   res.redirect('sessions/new');
  // } else {
    res.render('index', { 'email': req.session.user.email });
  // }
});

module.exports = router;

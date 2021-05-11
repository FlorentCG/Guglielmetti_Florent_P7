const express = require('express');
const router = express.Router();
const userCtrl = require('../controllers/user');
const auth = require('../middlewares/auth');
const multer = require('../middlewares/multer-profil');

// authentification 
router.post('/signup', userCtrl.signup);
router.post('/login',  userCtrl.login);

// elevate privileges
router.put('/privileges', auth,  userCtrl.grantPrivileges);

router.get('/users', auth,  userCtrl.getAllUsers);
router.get('/profil', auth,  userCtrl.getProfile);
router.put('/profil', auth, multer,  userCtrl.modifyProfile);
router.delete('/profil', auth,  userCtrl.deleteProfile);

module.exports = router;
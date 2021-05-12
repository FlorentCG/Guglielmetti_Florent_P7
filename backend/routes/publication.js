const express = require('express');
const router = express.Router();
const publicationControler = require('../controllers/publication');
const commentControler = require('../controllers/comment');
const likeControler = require('../controllers/like');
const auth = require('../middlewares/auth');
const multer = require('../middlewares/multer-publication');

// CRUD PUBLICATION
router.post('/', auth, multer,  publicationControler.createPublication);
router.get('/', auth, publicationControler.getAllPublication);
router.get('/:id', auth, publicationControler.getOnePublication);
router.put('/', auth, multer,  publicationControler.modifyPublication);
router.delete('/', auth, publicationControler.deletePublication);

// LIKE/DISLIKE
router.post('/like',  likeControler.likePublication);

// COMMENT
router.post('/comment', auth, multer,  commentControler.createComment);
router.put('/comment', auth, multer,  commentControler.modifyComment);
router.delete('/comment', auth,  commentControler.deleteComment);


module.exports = router;
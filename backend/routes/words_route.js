const express = require("express");
const router = express.Router();

const {
  getWords,
} = require("../controllers/words_controller");

router.get("/", getWords);

module.exports = router;
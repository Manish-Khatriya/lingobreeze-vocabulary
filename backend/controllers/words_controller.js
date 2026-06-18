const words = require("../data/words.json");

const getWords = (req, res) => {
  res.status(200).json(words);
};

module.exports = {
  getWords,
};
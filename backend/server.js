const express = require("express");
const cors = require("cors");

const wordsRoute = require("./routes/words_route");

const app = express();

app.use(cors());
app.use(express.json());

app.use("/words", wordsRoute);

const PORT = 3000;

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
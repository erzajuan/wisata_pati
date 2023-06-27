const route = require("express").Router();

route.get("/api", (req, res) => {
  res.status(200).json({
    message: "Welcome to Bali Rent API",
  });
});

const wisataRoute = require("./wisata_route");

route.use("/api/wisata", wisataRoute);

module.exports = route;
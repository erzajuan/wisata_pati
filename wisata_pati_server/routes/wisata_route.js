const wisataRoute = require("express").Router();
const { wisataController } = require("../controllers");
const { uploadGambar } = require("../services/multer");

wisataRoute.get("/", wisataController.getWisata);
wisataRoute.post("/", uploadGambar, wisataController.addWisata);

module.exports = wisataRoute;

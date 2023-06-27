var multer = require("multer");

const diskStorage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "./assets/");
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname);
  },
});

const uploadImage = multer({
  storage: diskStorage,
}).array("image", 5);
let uploadGambar = (req, res, next) => {
  uploadImage(req, res, function (err) {
    if (err) {
      return next(err);
    }
    if (typeof req.file == "undefined") {
      next();
    } else {
      image =
        req.protocol + "://" + req.get("host") + "/assets/" + req.file.filename;
      req.file.path = image;
      next();
    }
  });
};



module.exports = { uploadGambar };

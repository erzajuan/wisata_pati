const { tour, gambar } = require("../models");

class WisataController {
  static async getWisata(req, res) {
    try {
      let result = await tour.findAll({ include: [gambar] });
      res.status(200).json({
        status: true,
        message: "Berhasil mendapatkan data",
        data: result,
      });
    } catch (error) {
      res.status(500).json({
        status: false,
        message: "Gagal mendapatkan data",
        error: error,
      });
    }
  }

  static async addWisata(req, res) {
    try {
      const { name, location, description, map, virtual } = req.body;

      let result = await tour.create({
        name,
        location,
        description,
        map,
        virtual,
      });

      let image = [];
      typeof req.files[0] == "undefined"
        ? (image = [
            {
              path: "https://maps.gstatic.com/tactile/pane/default_geocode-2x.png",
            },
          ])
        : (image = req.files);

      image.forEach(async (image) => {
        await gambar.create({
          image: image.path,
          tourId: result.id,
        });
      });

      res.status(201).json({
        status: true,
        message: "Berhasil menambahkan Wisata",
        data: result,
      });
    } catch (error) {
      res.status(500).json({
        status: false,
        message: "Gagal menambahkan data",
        error: error,
      });
    }
  }
}

module.exports = WisataController;

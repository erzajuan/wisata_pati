'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class gambar extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      gambar.belongsTo(models.tour)
    }
  }
  gambar.init({
    image: DataTypes.STRING,
    tourId: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'gambar',
  });
  return gambar;
};
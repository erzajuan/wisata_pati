'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class tour extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      tour.hasMany(models.gambar)
    }
  }
  tour.init({
    name: DataTypes.STRING,
    location: DataTypes.STRING,
    description: DataTypes.STRING,
    map: DataTypes.STRING,
    virtual: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'tour',
  });
  return tour;
};
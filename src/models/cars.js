const BaseModel = require("./base");

//inheritance
class CarModel extends BaseModel {
  constructor() {
    super("cars");
    this.select = {
        id: true,
        name: true,
        seat: true,
        baggage: true,
        manufactur: true,
        img: true,
        year: true,
        price: true,
        isDriver: true
    };
  }
}

module.exports = CarModel

const BaseModel = require("./base");

//inheritance
class OrderModel extends BaseModel {
  constructor() {
    super("order");
    this.select = {
      id: true,
      order_no: true,
      overdue_time: true,
      status: true,
      is_driver: true,
      users: {
        select: {
          fullname: true
        }
      },
      cars: {
        select: {
          name: true,
          isAvailable: true,
        },
      }
    };
  }
}

module.exports = OrderModel

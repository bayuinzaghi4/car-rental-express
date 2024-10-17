-- CreateTable
CREATE TABLE "cars" (
    "id" SERIAL NOT NULL,
    "manufactur" VARCHAR,
    "type" VARCHAR,
    "licenseNumber" VARCHAR(30),
    "seat" INTEGER,
    "baggage" INTEGER,
    "transmission" VARCHAR,
    "year" VARCHAR,
    "name" VARCHAR,
    "description" TEXT,
    "isDriver" BOOLEAN,
    "isAvailable" BOOLEAN DEFAULT true,
    "img" TEXT,
    "price" INTEGER,
    "createdDt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "updatedDt" TIMESTAMP(3),
    "createdBy" VARCHAR,
    "updatedBy" VARCHAR,

    CONSTRAINT "cars_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "order" (
    "id" SERIAL NOT NULL,
    "order_no" VARCHAR NOT NULL,
    "user_id" INTEGER NOT NULL,
    "car_id" INTEGER NOT NULL,
    "start_time" TIMESTAMP(6),
    "end_time" TIMESTAMP(6),
    "total" DOUBLE PRECISION,
    "is_driver" BOOLEAN,
    "is_expired" BOOLEAN,
    "status" VARCHAR,
    "createdDt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "updatedDt" TIMESTAMP(3),
    "createdBy" VARCHAR,
    "updatedBy" VARCHAR,

    CONSTRAINT "order_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "fullname" VARCHAR,
    "email" VARCHAR(30) NOT NULL,
    "password" VARCHAR NOT NULL,
    "address" VARCHAR,
    "gender" VARCHAR,
    "avatar" VARCHAR,
    "phone_number" VARCHAR,
    "driver_license" TEXT,
    "birthdate" TEXT,
    "roleId" INTEGER NOT NULL,
    "createdDt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "updatedDt" TIMESTAMP(3),
    "createdBy" VARCHAR,
    "updatedBy" VARCHAR,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "roles" (
    "id" SERIAL NOT NULL,
    "role" TEXT NOT NULL,
    "createdDt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "updatedDt" TIMESTAMP(3),
    "createdBy" VARCHAR,
    "updatedBy" VARCHAR,

    CONSTRAINT "roles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "menus" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "icon" TEXT,
    "path" TEXT,
    "is_submenu" BOOLEAN NOT NULL DEFAULT false,
    "parent_id" INTEGER,
    "permissions" TEXT[],
    "createdDt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "updatedDt" TIMESTAMP(3),
    "createdBy" VARCHAR,
    "updatedBy" VARCHAR,

    CONSTRAINT "menus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "access" (
    "id" SERIAL NOT NULL,
    "role_id" INTEGER NOT NULL,
    "menu_id" INTEGER NOT NULL,
    "visible" BOOLEAN NOT NULL DEFAULT true,
    "grant" JSONB NOT NULL,
    "createdDt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "updatedDt" TIMESTAMP(3),
    "createdBy" VARCHAR,
    "updatedBy" VARCHAR,

    CONSTRAINT "access_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "car_name_index" ON "cars"("name");

-- CreateIndex
CREATE UNIQUE INDEX "order_order_no_key" ON "order"("order_no");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "users_phone_number_key" ON "users"("phone_number");

-- CreateIndex
CREATE UNIQUE INDEX "roles_role_key" ON "roles"("role");

-- CreateIndex
CREATE UNIQUE INDEX "menus_name_key" ON "menus"("name");

-- AddForeignKey
ALTER TABLE "order" ADD CONSTRAINT "order_car_id_fkey" FOREIGN KEY ("car_id") REFERENCES "cars"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "order" ADD CONSTRAINT "order_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "roles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "menus" ADD CONSTRAINT "menus_parent_id_fkey" FOREIGN KEY ("parent_id") REFERENCES "menus"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "access" ADD CONSTRAINT "access_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "roles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "access" ADD CONSTRAINT "access_menu_id_fkey" FOREIGN KEY ("menu_id") REFERENCES "menus"("id") ON DELETE CASCADE ON UPDATE CASCADE;

/*
  Warnings:

  - You are about to drop the column `overude_time` on the `order` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "order" DROP COLUMN "overude_time",
ADD COLUMN     "overdue_time" TIMESTAMP(3) NOT NULL DEFAULT NOW() + interval '24 hours';

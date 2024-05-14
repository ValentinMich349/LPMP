CREATE TABLE "evenements" (
  "id" integer PRIMARY KEY,
  "location" varchar,
  "date" date,
  "price" decimal,
  "description" text,
  "image_url" varchar,
  "created_at" timestamp,
  "user_id" integer
);

CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "username" varchar,
  "role" varchar,
  "first_name" varchar,
  "last_name" varchar,
  "address" varchar,
  "phone_number" varchar,
  "email" varchar,
  "is_admin" boolean DEFAULT false
);

CREATE TABLE "produits" (
  "id" integer PRIMARY KEY,
  "title" varchar,
  "description" text,
  "price" decimal,
  "image_url" varchar,
  "user_id" integer
);

CREATE TABLE "cartes" (
  "id" integer PRIMARY KEY,
  "longitude" decimal,
  "latitude" decimal,
  "titre" varchar,
  "description" text
);

CREATE TABLE "tags" (
  "id" integer PRIMARY KEY,
  "name" varchar UNIQUE,
  "description" text
);

CREATE TABLE "event_tags" (
  "event_id" integer,
  "tag_id" integer
);

CREATE TABLE "product_tags" (
  "product_id" integer,
  "tag_id" integer
);

COMMENT ON COLUMN "evenements"."description" IS 'Description of the event';

COMMENT ON COLUMN "produits"."description" IS 'Description of the product';

COMMENT ON COLUMN "tags"."description" IS 'Description of the tag';

ALTER TABLE "evenements" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "produits" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "event_tags" ADD FOREIGN KEY ("event_id") REFERENCES "evenements" ("id");

ALTER TABLE "event_tags" ADD FOREIGN KEY ("tag_id") REFERENCES "tags" ("id");

ALTER TABLE "product_tags" ADD FOREIGN KEY ("product_id") REFERENCES "produits" ("id");

ALTER TABLE "product_tags" ADD FOREIGN KEY ("tag_id") REFERENCES "tags" ("id");

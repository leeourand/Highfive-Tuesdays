CREATE TABLE "highfives" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user1_id" integer, "user2_id" integer, "created_at" datetime, "updated_at" datetime, "approved" bool);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar(255), "password_digest" varchar(255), "email" varchar(255), "created_at" datetime, "updated_at" datetime, "password_reset_token" varchar(255), "password_reset_sent_at" datetime);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20110711234825');

INSERT INTO schema_migrations (version) VALUES ('20110711235849');

INSERT INTO schema_migrations (version) VALUES ('20110712025824');

INSERT INTO schema_migrations (version) VALUES ('20110717153913');

INSERT INTO schema_migrations (version) VALUES ('20110724183252');
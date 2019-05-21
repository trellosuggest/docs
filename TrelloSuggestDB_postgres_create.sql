CREATE TABLE "logs" (
	"log_id" serial NOT NULL,
	"member_id" bigint NOT NULL,
	"datetime" DATE NOT NULL,
	"description" varchar(512) NOT NULL,
	CONSTRAINT logs_pk PRIMARY KEY ("log_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "members" (
	"member_id" serial NOT NULL,
	"avatar_url" varchar(512),
	"full_name" varchar(128),
	"username" varchar(64),
	"url" varchar(512) NOT NULL UNIQUE,
	CONSTRAINT members_pk PRIMARY KEY ("member_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "roles" (
	"role_id" serial NOT NULL,
	"board_id" varchar(128) NOT NULL,
	"name" varchar(16) NOT NULL UNIQUE,
	CONSTRAINT roles_pk PRIMARY KEY ("role_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "members_roles" (
	"member_id" bigint NOT NULL,
	"role_id" bigint NOT NULL,
	CONSTRAINT members_roles_pk PRIMARY KEY ("member_id","role_id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "logs" ADD CONSTRAINT "logs_fk0" FOREIGN KEY ("member_id") REFERENCES "members"("member_id");



ALTER TABLE "members_roles" ADD CONSTRAINT "members_roles_fk0" FOREIGN KEY ("member_id") REFERENCES "members"("member_id");
ALTER TABLE "members_roles" ADD CONSTRAINT "members_roles_fk1" FOREIGN KEY ("role_id") REFERENCES "roles"("role_id");

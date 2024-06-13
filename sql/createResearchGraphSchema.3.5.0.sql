CREATE TABLE "researcher" (
  "key" varchar PRIMARY KEY,
  "source" varchar NOT NULL,
  "local_id" varchar NOT NULL,
  "last_updated" timestamp NOT NULL,
  "full_name" varchar NOT NULL,
  "first_name" varchar,
  "last_name" varchar,
  "url" varchar,
  "orcid" varchar,
  "scopus_author_id" varchar
);

CREATE TABLE "dataset" (
  "key" varchar PRIMARY KEY,
  "source" varchar NOT NULL,
  "local_id" varchar NOT NULL,
  "last_updated" timestamp NOT NULL,
  "title" varchar NOT NULL,
  "author_list" varchar NOT NULL,
  "url" varchar,
  "doi" varchar,
  "publication_year" integer,
  "license" varchar,
  "size" integer
);

CREATE TABLE "publication" (
  "key" varchar PRIMARY KEY,
  "source" varchar NOT NULL,
  "local_id" varchar NOT NULL,
  "last_updated" timestamp NOT NULL,
  "title" varchar NOT NULL,
  "author_list" varchar NOT NULL,
  "url" varchar,
  "doi" varchar,
  "publication_year" integer,
  "scopus_eid" varchar
);

CREATE TABLE "grant" (
  "key" varchar PRIMARY KEY,
  "source" varchar NOT NULL,
  "local_id" varchar NOT NULL,
  "last_updated" timestamp NOT NULL,
  "title" varchar NOT NULL,
  "url" varchar,
  "purl" varchar,
  "doi" varchar,
  "publication_year" integer,
  "funder" varchar,
  "funding_amount" numeric,
  "funding_currency" varchar,
  "start_year" integer,
  "end_year" integer,
  "participant_list" varchar
);

CREATE TABLE "organisation" (
  "key" varchar PRIMARY KEY,
  "source" varchar NOT NULL,
  "local_id" varchar NOT NULL,
  "last_updated" timestamp NOT NULL,
  "name" varchar NOT NULL,
  "url" varchar,
  "grid" varchar,
  "doi" varchar,
  "ror" varchar,
  "isni" varchar,
  "wikidata" varchar,
  "country" varchar,
  "city" varchar,
  "latitute" numeric,
  "longitute" numeric
);

CREATE TABLE "relation_researcher_dataset" (
  "researcher_key" varchar NOT NULL,
  "dataset_key" varchar NOT NULL
);

CREATE TABLE "relation_researcher_publication" (
  "researcher_key" varchar NOT NULL,
  "publication_key" varchar NOT NULL
);

CREATE TABLE "relation_researcher_grant" (
  "researcher_key" varchar NOT NULL,
  "grant_key" varchar NOT NULL
);

CREATE TABLE "relation_researcher_organisation" (
  "researcher_key" varchar NOT NULL,
  "organisation_key" varchar NOT NULL
);

CREATE TABLE "relation_dataset_publication" (
  "dataset_key" varchar NOT NULL,
  "publication_key" varchar NOT NULL
);

CREATE TABLE "relation_dataset_grant" (
  "dataset_key" varchar NOT NULL,
  "grant_key" varchar NOT NULL
);

CREATE TABLE "relation_dataset_organisation" (
  "dataset_key" varchar NOT NULL,
  "organisation_key" varchar NOT NULL
);

CREATE TABLE "relation_publication_grant" (
  "publication_key" varchar NOT NULL,
  "grant_key" varchar NOT NULL
);

CREATE TABLE "relation_publication_organisation" (
  "publication_key" varchar NOT NULL,
  "organisation_key" varchar NOT NULL
);

CREATE TABLE "relation_grant_organisation" (
  "grant_key" varchar NOT NULL,
  "organisation_key" varchar NOT NULL
);

ALTER TABLE "relation_researcher_dataset" ADD FOREIGN KEY ("researcher_key") REFERENCES "researcher" ("key");

ALTER TABLE "relation_researcher_dataset" ADD FOREIGN KEY ("dataset_key") REFERENCES "dataset" ("key");

ALTER TABLE "relation_researcher_publication" ADD FOREIGN KEY ("researcher_key") REFERENCES "researcher" ("key");

ALTER TABLE "relation_researcher_publication" ADD FOREIGN KEY ("publication_key") REFERENCES "publication" ("key");

ALTER TABLE "relation_researcher_grant" ADD FOREIGN KEY ("researcher_key") REFERENCES "researcher" ("key");

ALTER TABLE "relation_researcher_grant" ADD FOREIGN KEY ("grant_key") REFERENCES "grant" ("key");

ALTER TABLE "relation_researcher_organisation" ADD FOREIGN KEY ("researcher_key") REFERENCES "researcher" ("key");

ALTER TABLE "relation_researcher_organisation" ADD FOREIGN KEY ("organisation_key") REFERENCES "organisation" ("key");

ALTER TABLE "relation_dataset_publication" ADD FOREIGN KEY ("dataset_key") REFERENCES "dataset" ("key");

ALTER TABLE "relation_dataset_publication" ADD FOREIGN KEY ("publication_key") REFERENCES "publication" ("key");

ALTER TABLE "relation_dataset_grant" ADD FOREIGN KEY ("dataset_key") REFERENCES "dataset" ("key");

ALTER TABLE "relation_dataset_grant" ADD FOREIGN KEY ("grant_key") REFERENCES "grant" ("key");

ALTER TABLE "relation_dataset_organisation" ADD FOREIGN KEY ("dataset_key") REFERENCES "dataset" ("key");

ALTER TABLE "relation_dataset_organisation" ADD FOREIGN KEY ("organisation_key") REFERENCES "organisation" ("key");

ALTER TABLE "relation_publication_grant" ADD FOREIGN KEY ("publication_key") REFERENCES "publication" ("key");

ALTER TABLE "relation_publication_grant" ADD FOREIGN KEY ("grant_key") REFERENCES "grant" ("key");

ALTER TABLE "relation_publication_organisation" ADD FOREIGN KEY ("publication_key") REFERENCES "publication" ("key");

ALTER TABLE "relation_publication_organisation" ADD FOREIGN KEY ("organisation_key") REFERENCES "organisation" ("key");

ALTER TABLE "relation_grant_organisation" ADD FOREIGN KEY ("grant_key") REFERENCES "grant" ("key");

ALTER TABLE "relation_grant_organisation" ADD FOREIGN KEY ("organisation_key") REFERENCES "organisation" ("key");

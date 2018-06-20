DROP TABLE deployments;
DROP TABLE legions;
DROP TABLE generals;

CREATE TABLE legions
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  moto VARCHAR(255),
  strength INT4
);

CREATE TABLE generals
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  -- province VARCHAR(255),
  reputation INT4
);

CREATE TABLE deployments
(
  id SERIAL8 PRIMARY KEY,
  legion_id INT4 REFERENCES legions(id) ON DELETE CASCADE,
  general_id INT4 REFERENCES generals(id) ON DELETE CASCADE,
  start_date VARCHAR(255),
  campaign_length INT4,
  returned BOOLEAN
);

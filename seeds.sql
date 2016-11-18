DROP TABLE IF EXISTS translations CASCADE;

CREATE TABLE translations(
  id SERIAL PRIMARY KEY,
  content TEXT,
  category VARCHAR(255) NOT NULL
);

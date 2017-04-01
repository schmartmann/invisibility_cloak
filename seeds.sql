DROP TABLE IF EXISTS translations CASCADE;

CREATE TABLE translations(
  id SERIAL PRIMARY KEY,
  content TEXT,
  type TEXT,
  display BOOLEAN
);

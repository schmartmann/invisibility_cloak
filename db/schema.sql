DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS translations;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) UNIQUE,
  password_digest VARCHAR(255)
);

CREATE TABLE translations (
  id SERIAL PRIMARY KEY,
  content TEXT,
  type VARCHAR(255)
)

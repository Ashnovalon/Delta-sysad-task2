CREATE USER 'basic'@'%' IDENTIFIED BY 'password';
GRANT SELECT ON testdb.* TO 'basic'@'%';
FLUSH PRIVILEGES;

SELECT
  relname AS table_name,
  n_live_tup AS total_rows
FROM pg_stat_user_tables
ORDER BY n_live_tup DESC;
CREATE OR REPLACE VIEW stops_with_percentage AS
SELECT
  s.id,
  s.Jour,
  s.Debut,
  s.Fin,
  s.Duree,
  s.cause_id,
  s.equipe,
  ROUND(
    s.Duree * 100.0 / SUM(s.Duree) OVER (PARTITION BY s.Jour),
    2
  ) AS pourcentage
FROM stops s;
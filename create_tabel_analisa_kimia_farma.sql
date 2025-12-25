-- Create Analysis Table for Kimia Farma Performance Analytics
-- Author: Akbar Nur Rizqi
-- Environment: Google BigQuery

CREATE OR REPLACE TABLE `rakamin-kfa-analytics.kimia_farma.tabel_analisa_kimia_farma` AS
SELECT
  t.transaction_id,
  DATE(t.date) AS date,
  t.branch_id,
  b.branch_name,
  b.kota,
  b.provinsi,
  b.rating AS rating_cabang,
  t.customer_name,
  t.product_id,
  p.product_name,
  t.price AS actual_price,
  t.discount_percentage,

  -- Gross Profit Percentage
  CASE
    WHEN t.price <= 50000 THEN 0.10
    WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15
    WHEN t.price > 100000 AND t.price <= 300000 THEN 0.20
    WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
    ELSE 0.30
  END AS persentase_gross_laba,

  -- Nett Sales
  (t.price - (t.price * t.discount_percentage)) AS nett_sales,

  -- Nett Profit
  ((t.price - (t.price * t.discount_percentage)) *
    CASE
      WHEN t.price <= 50000 THEN 0.10
      WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15
      WHEN t.price > 100000 AND t.price <= 300000 THEN 0.20
      WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
      ELSE 0.30
    END
  ) AS nett_profit,

  t.rating AS rating_transaksi

FROM `rakamin-kfa-analytics.kimia_farma.kf_final_transaction` t
LEFT JOIN `rakamin-kfa-analytics.kimia_farma.kf_product` p
  ON t.product_id = p.product_id
LEFT JOIN `rakamin-kfa-analytics.kimia_farma.kf_kantor_cabang` b
  ON t.branch_id = b.branch_id;

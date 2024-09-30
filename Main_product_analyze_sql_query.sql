WITH
  first_day_purchase AS (
  SELECT
    PARSE_DATE('%Y%m%d', event_date) AS event_date,
    user_pseudo_id AS user_id,
    MIN(TIMESTAMP_MICROS(event_timestamp)) AS first_purchase_timestamp
  FROM
    `turing_data_analytics.raw_events`
  WHERE
    event_name = 'purchase'
  GROUP BY
    event_date,
    user_id ),
  purchase_details AS (
  SELECT
    PARSE_DATE('%Y%m%d', event_date) AS event_date,
    user_pseudo_id AS user_id,
    TIMESTAMP_MICROS(event_timestamp) AS event_timestamp,
    category AS device,
    mobile_brand_name,
    browser,
    country,
    purchase_revenue_in_usd,
    total_item_quantity,
    transaction_id
  FROM
    `turing_data_analytics.raw_events`
  WHERE
    event_name = 'purchase' ),
  first_action_of_day AS (
  SELECT
    PARSE_DATE('%Y%m%d', event_date) AS event_date,
    user_pseudo_id AS user_id,
    MIN(TIMESTAMP_MICROS(event_timestamp)) AS first_action_timestamp,
    event_name AS first_action_name
  FROM
    `turing_data_analytics.raw_events`
  WHERE
    event_name IN ('first_visit',
      'view_item',
      'add_to_cart',
      'begin_checkout',
      'add_payment_info')
  GROUP BY
    event_date,
    user_id,
    event_name )
SELECT
  first_action_of_day.event_date,
  first_action_of_day.user_id,
  first_action_of_day.first_action_name,
  TIMESTAMP_DIFF(first_day_purchase.first_purchase_timestamp, first_action_of_day.first_action_timestamp, MINUTE) AS time_to_purchase_minutes,
  purchase_details.purchase_revenue_in_usd,
  purchase_details.total_item_quantity,
  purchase_details.device,
  purchase_details.mobile_brand_name,
  purchase_details.browser,
  purchase_details.country
FROM
  first_action_of_day
INNER JOIN
  first_day_purchase
ON
  first_action_of_day.user_id = first_day_purchase.user_id
  AND first_action_of_day.event_date = first_day_purchase.event_date
INNER JOIN
  purchase_details
ON
  first_day_purchase.user_id = purchase_details.user_id
  AND first_day_purchase.first_purchase_timestamp = purchase_details.event_timestamp
ORDER BY
  first_action_of_day.event_date,
  first_action_of_day.user_id,
  first_action_of_day.first_action_timestamp;

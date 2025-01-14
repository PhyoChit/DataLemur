SELECT ROUND(SUM(item_count::DECIMAL * order_occurrences)/
       SUM(order_occurrences), 1)
FROM items_per_order

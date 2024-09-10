DROP DATABASE IF EXISTS wb_db_l0;
CREATE DATABASE wb_db_l0;

\c wb_db_l0

CREATE TABLE orders (
    sm_id SERIAL PRIMARY KEY,
    order_uid TEXT UNIQUE NOT NULL,
    track_number TEXT,
    entry TEXT,
    locale TEXT,
    internal_signature TEXT,
    customer_id TEXT,
    delivery_service TEXT,
    shardkey TEXT,
    date_created TEXT,
    oof_shard TEXT
);

CREATE TABLE deliveries (
    order_uid TEXT REFERENCES orders(order_uid),
    name TEXT,
    phone TEXT,
    zip TEXT,
    city TEXT,
    address TEXT,
    region TEXT,
    email TEXT
);

CREATE TABLE payments (
    order_uid TEXT REFERENCES orders(order_uid),
    transaction TEXT,
    request_id TEXT,
    currency TEXT,
    provider TEXT,
    amount INTEGER,
    payment_dt INTEGER,
    bank TEXT,
    delivery_cost INTEGER,
    goods_total INTEGER,
    custom_fee INTEGER
);

CREATE TABLE items (
    order_uid TEXT REFERENCES orders(order_uid),
    chrt_id INTEGER,
    track_number TEXT,
    price INTEGER,
    rid TEXT,
    name TEXT,
    sale INTEGER,
    size TEXT,
    total_price INTEGER,
    nm_id INTEGER,
    brand TEXT,
    status INTEGER
);

\d

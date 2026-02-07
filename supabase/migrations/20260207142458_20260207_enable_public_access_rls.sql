/*
  # Enable Public Access via RLS Policies

  1. Overview
    - Create public read/write access policies for all tables
    - Allows anonymous users to read and modify data
    - Enables the app to function without authentication

  2. Tables Updated
    - depots
    - crate_types
    - customers
    - incoming_crates
    - outgoing_crates
    - transfers
    - daily_closings
    - customer_ledger_transactions
*/

-- Depots: Public read
DROP POLICY IF EXISTS "Public read depots" ON depots;
CREATE POLICY "Public read depots"
  ON depots
  FOR SELECT
  TO public
  USING (true);

-- Crate Types: Public read
DROP POLICY IF EXISTS "Public read crate_types" ON crate_types;
CREATE POLICY "Public read crate_types"
  ON crate_types
  FOR SELECT
  TO public
  USING (true);

-- Customers: Public read/write
DROP POLICY IF EXISTS "Public read customers" ON customers;
DROP POLICY IF EXISTS "Public write customers" ON customers;

CREATE POLICY "Public read customers"
  ON customers
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Public write customers"
  ON customers
  FOR INSERT
  TO public
  WITH CHECK (true);

CREATE POLICY "Public update customers"
  ON customers
  FOR UPDATE
  TO public
  USING (true)
  WITH CHECK (true);

-- Incoming Crates: Public read/write
DROP POLICY IF EXISTS "Public read incoming_crates" ON incoming_crates;
DROP POLICY IF EXISTS "Public write incoming_crates" ON incoming_crates;

CREATE POLICY "Public read incoming_crates"
  ON incoming_crates
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Public write incoming_crates"
  ON incoming_crates
  FOR INSERT
  TO public
  WITH CHECK (true);

-- Outgoing Crates: Public read/write
DROP POLICY IF EXISTS "Public read outgoing_crates" ON outgoing_crates;
DROP POLICY IF EXISTS "Public write outgoing_crates" ON outgoing_crates;

CREATE POLICY "Public read outgoing_crates"
  ON outgoing_crates
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Public write outgoing_crates"
  ON outgoing_crates
  FOR INSERT
  TO public
  WITH CHECK (true);

-- Transfers: Public read/write
DROP POLICY IF EXISTS "Public read transfers" ON transfers;
DROP POLICY IF EXISTS "Public write transfers" ON transfers;

CREATE POLICY "Public read transfers"
  ON transfers
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Public write transfers"
  ON transfers
  FOR INSERT
  TO public
  WITH CHECK (true);

-- Daily Closings: Public read/write
DROP POLICY IF EXISTS "Public read daily_closings" ON daily_closings;
DROP POLICY IF EXISTS "Public write daily_closings" ON daily_closings;

CREATE POLICY "Public read daily_closings"
  ON daily_closings
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Public write daily_closings"
  ON daily_closings
  FOR INSERT
  TO public
  WITH CHECK (true);

-- Customer Ledger Transactions: Public read/write
DROP POLICY IF EXISTS "Public read customer_ledger_transactions" ON customer_ledger_transactions;
DROP POLICY IF EXISTS "Public write customer_ledger_transactions" ON customer_ledger_transactions;
DROP POLICY IF EXISTS "Public delete customer_ledger_transactions" ON customer_ledger_transactions;

CREATE POLICY "Public read customer_ledger_transactions"
  ON customer_ledger_transactions
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Public write customer_ledger_transactions"
  ON customer_ledger_transactions
  FOR INSERT
  TO public
  WITH CHECK (true);

CREATE POLICY "Public delete customer_ledger_transactions"
  ON customer_ledger_transactions
  FOR DELETE
  TO public
  USING (true);

/*
  # Update RLS Policies for Anonymous User Access

  1. Changes
    - Update policies to allow both authenticated and anonymous users
    - Enable read/write access to all tables for business operations
    - Maintain basic RLS framework for future auth implementation

  2. Security
    - All users can read and write data
    - This allows the app to function without mandatory authentication
    - Can be restricted later when auth is implemented
*/

-- Drop and recreate policies for customers to allow anon access
DROP POLICY IF EXISTS "Customers are readable by authenticated users" ON customers;
DROP POLICY IF EXISTS "Authenticated users can create customers" ON customers;
DROP POLICY IF EXISTS "Authenticated users can update customers" ON customers;

CREATE POLICY "Customers are readable"
  ON customers
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Customers can be created"
  ON customers
  FOR INSERT
  TO public
  WITH CHECK (true);

CREATE POLICY "Customers can be updated"
  ON customers
  FOR UPDATE
  TO public
  USING (true)
  WITH CHECK (true);

-- Update incoming_crates policies
DROP POLICY IF EXISTS "Incoming crates are readable" ON incoming_crates;
DROP POLICY IF EXISTS "Authenticated users can create incoming crates" ON incoming_crates;

CREATE POLICY "Incoming crates are readable"
  ON incoming_crates
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Incoming crates can be created"
  ON incoming_crates
  FOR INSERT
  TO public
  WITH CHECK (true);

-- Update outgoing_crates policies
DROP POLICY IF EXISTS "Outgoing crates are readable" ON outgoing_crates;
DROP POLICY IF EXISTS "Authenticated users can create outgoing crates" ON outgoing_crates;

CREATE POLICY "Outgoing crates are readable"
  ON outgoing_crates
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Outgoing crates can be created"
  ON outgoing_crates
  FOR INSERT
  TO public
  WITH CHECK (true);

-- Update transfers policies
DROP POLICY IF EXISTS "Transfers are readable" ON transfers;
DROP POLICY IF EXISTS "Authenticated users can create transfers" ON transfers;

CREATE POLICY "Transfers are readable"
  ON transfers
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Transfers can be created"
  ON transfers
  FOR INSERT
  TO public
  WITH CHECK (true);

-- Update daily_closings policies
DROP POLICY IF EXISTS "Daily closings are readable" ON daily_closings;
DROP POLICY IF EXISTS "Authenticated users can create daily closings" ON daily_closings;

CREATE POLICY "Daily closings are readable"
  ON daily_closings
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Daily closings can be created"
  ON daily_closings
  FOR INSERT
  TO public
  WITH CHECK (true);

-- Update customer_ledger_transactions policies
DROP POLICY IF EXISTS "Customer ledger transactions are readable" ON customer_ledger_transactions;
DROP POLICY IF EXISTS "Authenticated users can create customer ledger transactions" ON customer_ledger_transactions;

CREATE POLICY "Customer ledger transactions are readable"
  ON customer_ledger_transactions
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Customer ledger transactions can be created"
  ON customer_ledger_transactions
  FOR INSERT
  TO public
  WITH CHECK (true);

-- Add delete policies for maintenance
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'customer_ledger_transactions' AND policyname = 'Customer ledger transactions can be deleted'
  ) THEN
    CREATE POLICY "Customer ledger transactions can be deleted"
      ON customer_ledger_transactions
      FOR DELETE
      TO public
      USING (true);
  END IF;
END $$;

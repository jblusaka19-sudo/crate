/*
  # Fix RLS Policies for Public Read Access

  1. Changes
    - Add public read policies for depots and crate_types tables
    - Enable public (anonymous) users to read depot and crate type data
    - Keep other tables restricted to authenticated users

  2. Security
    - Public can only READ depots and crate_types
    - All write operations remain restricted to authenticated users
    - Other tables maintain existing restrictions
*/

-- Allow public read access to depots
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'depots' AND policyname = 'Depots are readable by everyone'
  ) THEN
    CREATE POLICY "Depots are readable by everyone"
      ON depots
      FOR SELECT
      TO public
      USING (true);
  END IF;
END $$;

-- Allow public read access to crate_types
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'crate_types' AND policyname = 'Crate types are readable by everyone'
  ) THEN
    CREATE POLICY "Crate types are readable by everyone"
      ON crate_types
      FOR SELECT
      TO public
      USING (true);
  END IF;
END $$;

-- Allow authenticated users to read customers
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'customers' AND policyname = 'Customers are readable by authenticated users'
  ) THEN
    CREATE POLICY "Customers are readable by authenticated users"
      ON customers
      FOR SELECT
      TO authenticated
      USING (true);
  END IF;
END $$;

-- Allow authenticated users to insert customers
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'customers' AND policyname = 'Authenticated users can create customers'
  ) THEN
    CREATE POLICY "Authenticated users can create customers"
      ON customers
      FOR INSERT
      TO authenticated
      WITH CHECK (true);
  END IF;
END $$;

-- Allow authenticated users to update customers
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'customers' AND policyname = 'Authenticated users can update customers'
  ) THEN
    CREATE POLICY "Authenticated users can update customers"
      ON customers
      FOR UPDATE
      TO authenticated
      USING (true)
      WITH CHECK (true);
  END IF;
END $$;

-- Allow authenticated users to read incoming_crates
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'incoming_crates' AND policyname = 'Incoming crates are readable'
  ) THEN
    CREATE POLICY "Incoming crates are readable"
      ON incoming_crates
      FOR SELECT
      TO authenticated
      USING (true);
  END IF;
END $$;

-- Allow authenticated users to insert incoming_crates
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'incoming_crates' AND policyname = 'Authenticated users can create incoming crates'
  ) THEN
    CREATE POLICY "Authenticated users can create incoming crates"
      ON incoming_crates
      FOR INSERT
      TO authenticated
      WITH CHECK (true);
  END IF;
END $$;

-- Allow authenticated users to read outgoing_crates
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'outgoing_crates' AND policyname = 'Outgoing crates are readable'
  ) THEN
    CREATE POLICY "Outgoing crates are readable"
      ON outgoing_crates
      FOR SELECT
      TO authenticated
      USING (true);
  END IF;
END $$;

-- Allow authenticated users to insert outgoing_crates
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'outgoing_crates' AND policyname = 'Authenticated users can create outgoing crates'
  ) THEN
    CREATE POLICY "Authenticated users can create outgoing crates"
      ON outgoing_crates
      FOR INSERT
      TO authenticated
      WITH CHECK (true);
  END IF;
END $$;

-- Allow authenticated users to read transfers
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'transfers' AND policyname = 'Transfers are readable'
  ) THEN
    CREATE POLICY "Transfers are readable"
      ON transfers
      FOR SELECT
      TO authenticated
      USING (true);
  END IF;
END $$;

-- Allow authenticated users to insert transfers
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'transfers' AND policyname = 'Authenticated users can create transfers'
  ) THEN
    CREATE POLICY "Authenticated users can create transfers"
      ON transfers
      FOR INSERT
      TO authenticated
      WITH CHECK (true);
  END IF;
END $$;

-- Allow authenticated users to read daily_closings
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'daily_closings' AND policyname = 'Daily closings are readable'
  ) THEN
    CREATE POLICY "Daily closings are readable"
      ON daily_closings
      FOR SELECT
      TO authenticated
      USING (true);
  END IF;
END $$;

-- Allow authenticated users to insert daily_closings
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'daily_closings' AND policyname = 'Authenticated users can create daily closings'
  ) THEN
    CREATE POLICY "Authenticated users can create daily closings"
      ON daily_closings
      FOR INSERT
      TO authenticated
      WITH CHECK (true);
  END IF;
END $$;

-- Allow authenticated users to read customer_ledger_transactions
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'customer_ledger_transactions' AND policyname = 'Customer ledger transactions are readable'
  ) THEN
    CREATE POLICY "Customer ledger transactions are readable"
      ON customer_ledger_transactions
      FOR SELECT
      TO authenticated
      USING (true);
  END IF;
END $$;

-- Allow authenticated users to insert customer_ledger_transactions
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'customer_ledger_transactions' AND policyname = 'Authenticated users can create customer ledger transactions'
  ) THEN
    CREATE POLICY "Authenticated users can create customer ledger transactions"
      ON customer_ledger_transactions
      FOR INSERT
      TO authenticated
      WITH CHECK (true);
  END IF;
END $$;

-- InsForge Schema Setup for Automobile Showroom Management System

CREATE TABLE IF NOT EXISTS app_users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  role TEXT NOT NULL DEFAULT 'Sales Staff',
  phone TEXT,
  avatar_url TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS customers (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  phone TEXT NOT NULL,
  cnic TEXT,
  address TEXT,
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS bike_models (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  model_name TEXT NOT NULL,
  variant TEXT NOT NULL,
  engine_cc INTEGER DEFAULT 125,
  base_price NUMERIC(12,2) NOT NULL,
  specs TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS bikes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  model_id UUID REFERENCES bike_models(id) ON DELETE SET NULL,
  model_name TEXT NOT NULL,
  variant TEXT NOT NULL,
  engine_no TEXT UNIQUE NOT NULL,
  chassis_no TEXT UNIQUE NOT NULL,
  color TEXT NOT NULL,
  cost_price NUMERIC(12,2) NOT NULL,
  selling_price NUMERIC(12,2) NOT NULL,
  status TEXT NOT NULL DEFAULT 'Available',
  arrival_date DATE NOT NULL DEFAULT CURRENT_DATE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS vehicles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  customer_id UUID REFERENCES customers(id) ON DELETE SET NULL,
  bike_id UUID REFERENCES bikes(id) ON DELETE CASCADE,
  engine_no TEXT NOT NULL,
  chassis_no TEXT NOT NULL,
  model_name TEXT NOT NULL,
  color TEXT,
  reg_no TEXT,
  reg_letter TEXT,
  reg_status TEXT DEFAULT 'Pending',
  reg_date DATE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS products_parts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  barcode TEXT UNIQUE NOT NULL,
  part_name TEXT NOT NULL,
  part_number TEXT,
  category TEXT NOT NULL DEFAULT 'General',
  cost_price NUMERIC(12,2) NOT NULL,
  selling_price NUMERIC(12,2) NOT NULL,
  current_stock INTEGER NOT NULL DEFAULT 0,
  min_stock_level INTEGER NOT NULL DEFAULT 5,
  unit TEXT DEFAULT 'Pcs',
  arrival_date DATE NOT NULL DEFAULT CURRENT_DATE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS inventory_transactions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  part_id UUID REFERENCES products_parts(id) ON DELETE CASCADE,
  barcode TEXT NOT NULL,
  part_name TEXT NOT NULL,
  transaction_type TEXT NOT NULL,
  quantity INTEGER NOT NULL,
  prev_quantity INTEGER NOT NULL,
  new_quantity INTEGER NOT NULL,
  reference_no TEXT,
  reason TEXT,
  created_by TEXT DEFAULT 'System',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS bike_sales (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  invoice_no TEXT UNIQUE NOT NULL,
  customer_id UUID REFERENCES customers(id) ON DELETE SET NULL,
  customer_name TEXT NOT NULL,
  customer_phone TEXT NOT NULL,
  bike_id UUID REFERENCES bikes(id) ON DELETE RESTRICT,
  model_name TEXT NOT NULL,
  variant TEXT NOT NULL,
  engine_no TEXT NOT NULL,
  chassis_no TEXT NOT NULL,
  sale_date DATE NOT NULL DEFAULT CURRENT_DATE,
  total_price NUMERIC(12,2) NOT NULL,
  down_payment NUMERIC(12,2) NOT NULL DEFAULT 0,
  remaining_amount NUMERIC(12,2) NOT NULL DEFAULT 0,
  payment_type TEXT NOT NULL DEFAULT 'Cash',
  delivery_status TEXT NOT NULL DEFAULT 'Delivered',
  created_by TEXT DEFAULT 'System',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS parts_sales (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  invoice_no TEXT UNIQUE NOT NULL,
  customer_name TEXT DEFAULT 'Walk-in Customer',
  customer_phone TEXT,
  sale_date DATE NOT NULL DEFAULT CURRENT_DATE,
  total_amount NUMERIC(12,2) NOT NULL,
  payment_method TEXT DEFAULT 'Cash',
  created_by TEXT DEFAULT 'System',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS parts_sale_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  parts_sale_id UUID REFERENCES parts_sales(id) ON DELETE CASCADE,
  part_id UUID REFERENCES products_parts(id) ON DELETE RESTRICT,
  part_name TEXT NOT NULL,
  barcode TEXT NOT NULL,
  quantity INTEGER NOT NULL,
  unit_price NUMERIC(12,2) NOT NULL,
  total_price NUMERIC(12,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS installments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  bike_sale_id UUID REFERENCES bike_sales(id) ON DELETE CASCADE,
  customer_id UUID REFERENCES customers(id) ON DELETE CASCADE,
  installment_no INTEGER NOT NULL,
  due_date DATE NOT NULL,
  amount NUMERIC(12,2) NOT NULL,
  paid_amount NUMERIC(12,2) DEFAULT 0,
  status TEXT NOT NULL DEFAULT 'Unpaid',
  paid_date DATE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS expenses (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  voucher_no TEXT UNIQUE NOT NULL,
  expense_date DATE NOT NULL DEFAULT CURRENT_DATE,
  category TEXT NOT NULL,
  amount NUMERIC(12,2) NOT NULL,
  description TEXT NOT NULL,
  payee TEXT,
  payment_method TEXT DEFAULT 'Cash',
  created_by TEXT DEFAULT 'System',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS salaries (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  employee_name TEXT NOT NULL,
  role TEXT NOT NULL,
  month_year TEXT NOT NULL,
  amount NUMERIC(12,2) NOT NULL,
  payment_date DATE NOT NULL DEFAULT CURRENT_DATE,
  status TEXT NOT NULL DEFAULT 'Paid',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS suppliers (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  contact_person TEXT,
  phone TEXT NOT NULL,
  address TEXT,
  total_payable NUMERIC(12,2) DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS supplier_payables (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  supplier_id UUID REFERENCES suppliers(id) ON DELETE CASCADE,
  invoice_no TEXT NOT NULL,
  purchase_date DATE NOT NULL DEFAULT CURRENT_DATE,
  description TEXT NOT NULL,
  total_amount NUMERIC(12,2) NOT NULL,
  paid_amount NUMERIC(12,2) DEFAULT 0,
  status TEXT NOT NULL DEFAULT 'Unpaid',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS audit_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_name TEXT NOT NULL DEFAULT 'Admin User',
  action TEXT NOT NULL,
  entity TEXT NOT NULL,
  entity_id TEXT,
  details TEXT NOT NULL,
  timestamp TIMESTAMPTZ DEFAULT NOW()
);

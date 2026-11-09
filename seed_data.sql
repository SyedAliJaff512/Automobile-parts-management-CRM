-- Seed Realistic Data for Automobile Showroom Management System

-- 1. Users
INSERT INTO app_users (email, name, role, phone) VALUES
('admin@showroom.com', 'System Administrator', 'Administrator', '0300-0000000'),
('manager@showroom.com', 'Shahid Raza (Manager)', 'Manager', '0300-1111111'),
('sales@showroom.com', 'Bilal Hassan (Sales)', 'Sales Staff', '0300-2222222'),
('inventory@showroom.com', 'Zain Ul Abidin (Stock)', 'Inventory Staff', '0300-3333333')
ON CONFLICT (email) DO NOTHING;

-- 2. Customers
INSERT INTO customers (id, name, phone, cnic, address, notes) VALUES
('11111111-1111-1111-1111-111111111111', 'Muhammad Ali', '0300-1234567', '35202-1234567-1', 'House 42, Block B, Gulberg III, Lahore', 'Regular customer, purchased CG 125 on financing'),
('22222222-2222-2222-2222-222222222222', 'Tariq Mehmood', '0321-9876543', '35201-9876543-3', 'House 112, Street 4, Model Town, Lahore', 'Full cash payment customer'),
('33333333-3333-3333-3333-333333333333', 'Usman Ghani', '0333-4567890', '35202-4567890-5', 'Plaza 8, Sector C, DHA Phase 5, Lahore', 'Buys bulk spare parts'),
('44444444-4444-4444-4444-444444444444', 'Hamza Sheikh', '0312-3456789', '35201-3456789-7', 'Flat 304, Johar Town, Lahore', 'Inquired about Suzuki GSX 150')
ON CONFLICT DO NOTHING;

-- 3. Bike Models
INSERT INTO bike_models (id, model_name, variant, engine_cc, base_price, specs) VALUES
('a1111111-1111-1111-1111-111111111111', 'Honda CG 125', 'Self Start 2026', 125, 234900.00, '4-Stroke OHV Air Cooled, 5-Speed Mesh Transmission'),
('a2222222-2222-2222-2222-222222222222', 'Yamaha YBR 125G', 'Matte Black Limited', 125, 485000.00, 'Single Cylinder OHC Engine, Front Disc Brake'),
('a3333333-3333-3333-3333-333333333333', 'Suzuki GSX 150', 'Special Edition', 150, 520000.00, '150cc Fuel Injected, Twin Disc Brakes, Alloy Rims'),
('a4444444-4444-4444-4444-444444444444', 'Honda CD 70', 'Dream 2026', 70, 157900.00, '4-Stroke OHC 70cc, Fuel Efficient Eco Engine')
ON CONFLICT DO NOTHING;

-- 4. Bikes Inventory
INSERT INTO bikes (id, model_id, model_name, variant, engine_no, chassis_no, color, cost_price, selling_price, status, arrival_date) VALUES
('b1111111-1111-1111-1111-111111111111', 'a1111111-1111-1111-1111-111111111111', 'Honda CG 125', 'Self Start 2026', 'CG125E-982411', 'CG125C-982411', 'Red', 215000.00, 235000.00, 'Sold', '2026-06-10'),
('b2222222-2222-2222-2222-222222222222', 'a2222222-2222-2222-2222-222222222222', 'Yamaha YBR 125G', 'Matte Black Limited', 'YBR125-781204', 'YBR125C-781204', 'Matte Black', 440000.00, 485000.00, 'Sold', '2026-06-15'),
('b3333333-3333-3333-3333-333333333333', 'a3333333-3333-3333-3333-333333333333', 'Suzuki GSX 150', 'Special Edition', 'GSX150-109234', 'GSX150C-109234', 'Blue Metallic', 475000.00, 520000.00, 'Available', '2026-07-01'),
('b4444444-4444-4444-4444-444444444444', 'a4444444-4444-4444-4444-444444444444', 'Honda CD 70', 'Dream 2026', 'CD70E-551928', 'CD70C-551928', 'Black Red', 142000.00, 158000.00, 'Available', '2026-07-10'),
('b5555555-5555-5555-5555-555555555555', 'a1111111-1111-1111-1111-111111111111', 'Honda CG 125', 'Self Start 2026', 'CG125E-994102', 'CG125C-994102', 'Black', 215000.00, 235000.00, 'Available', '2026-08-01'),
('b6666666-6666-6666-6666-666666666666', 'a2222222-2222-2222-2222-222222222222', 'Yamaha YBR 125G', 'Matte Black Limited', 'YBR125-882190', 'YBR125C-882190', 'Racing Blue', 440000.00, 485000.00, 'Reserved', '2026-08-12')
ON CONFLICT DO NOTHING;

-- 5. Products & Parts (Barcode inventory) - Valid Hex UUIDs starting with c
INSERT INTO products_parts (id, barcode, part_name, part_number, category, cost_price, selling_price, current_stock, min_stock_level, unit, arrival_date) VALUES
('c1111111-1111-1111-1111-111111111111', 'BP-10025', 'Honda CG 125 Brake Pad Set', 'BP-CG125-01', 'Brakes', 450.00, 850.00, 45, 10, 'Set', '2026-05-10'),
('c2222222-2222-2222-2222-222222222222', 'OF-20014', 'Yamaha YBR Oil Filter Element', 'OF-YBR125-02', 'Filters', 250.00, 500.00, 60, 15, 'Pcs', '2026-05-15'),
('c3333333-3333-3333-3333-333333333333', 'SP-30089', 'NGK Spark Plug D8EA (CG125)', 'SP-NGK-D8EA', 'Engine', 280.00, 450.00, 4, 10, 'Pcs', '2026-04-01'),
('c4444444-4444-4444-4444-444444444444', 'CO-40012', 'Heavy Duty Engine Oil 4T 20W50 1L', 'OIL-4T-1L', 'Oils & Fluids', 1100.00, 1650.00, 80, 20, 'Bottle', '2026-07-20'),
('c5555555-5555-5555-5555-555555555555', 'CL-50033', 'CG 125 Clutch Cable Genuine', 'CL-CG125-GEN', 'Cables', 320.00, 600.00, 2, 8, 'Pcs', '2026-03-15'),
('c6666666-6666-6666-6666-666666666666', 'BT-60099', 'AGM Dry Battery 12V 7Ah', 'BAT-12V7AH', 'Electrical', 3200.00, 4800.00, 12, 5, 'Unit', '2026-06-05'),
('c7777777-7777-7777-7777-777777777777', 'TR-70041', 'Panther Tubeless Tire 3.00-18', 'TIR-30018-PT', 'Tires & Wheels', 3800.00, 5400.00, 18, 6, 'Pcs', '2026-07-05'),
('c8888888-8888-8888-8888-888888888888', 'HL-80015', 'LED Projector Headlight Assembly', 'HL-LED-PROJ', 'Electrical', 2100.00, 3200.00, 10, 3, 'Set', '2026-08-01')
ON CONFLICT DO NOTHING;

-- 6. Inventory Transactions
INSERT INTO inventory_transactions (part_id, barcode, part_name, transaction_type, quantity, prev_quantity, new_quantity, reference_no, reason, created_by, created_at) VALUES
('c1111111-1111-1111-1111-111111111111', 'BP-10025', 'Honda CG 125 Brake Pad Set', 'Stock In', 50, 0, 50, 'PO-2026-001', 'Initial stock receiving via barcode scanner', 'Zain Ul Abidin (Stock)', '2026-05-10 10:00:00'),
('c1111111-1111-1111-1111-111111111111', 'BP-10025', 'Honda CG 125 Brake Pad Set', 'Sale', -5, 50, 45, 'INV-P2026-001', 'Customer counter sale', 'Bilal Hassan (Sales)', '2026-08-25 11:30:00'),
('c4444444-4444-4444-4444-444444444444', 'CO-40012', 'Heavy Duty Engine Oil 4T 20W50 1L', 'Stock In', 100, 0, 100, 'PO-2026-002', 'Bulk shipment received', 'Zain Ul Abidin (Stock)', '2026-07-20 14:00:00');

-- 7. Bike Sales
INSERT INTO bike_sales (id, invoice_no, customer_id, customer_name, customer_phone, bike_id, model_name, variant, engine_no, chassis_no, sale_date, total_price, down_payment, remaining_amount, payment_type, delivery_status, created_by, created_at) VALUES
('d1111111-1111-1111-1111-111111111111', 'INV-B2026-001', '11111111-1111-1111-1111-111111111111', 'Muhammad Ali', '0300-1234567', 'b1111111-1111-1111-1111-111111111111', 'Honda CG 125', 'Self Start 2026', 'CG125E-982411', 'CG125C-982411', '2026-06-15', 235000.00, 85000.00, 150000.00, 'Installment', 'Delivered', 'Bilal Hassan (Sales)', '2026-06-15 12:00:00'),
('d2222222-2222-2222-2222-222222222222', 'INV-B2026-002', '22222222-2222-2222-2222-222222222222', 'Tariq Mehmood', '0321-9876543', 'b2222222-2222-2222-2222-222222222222', 'Yamaha YBR 125G', 'Matte Black Limited', 'YBR125-781204', 'YBR125C-781204', '2026-08-25', 485000.00, 485000.00, 0.00, 'Cash', 'Delivered', 'Bilal Hassan (Sales)', '2026-08-25 15:30:00')
ON CONFLICT DO NOTHING;

-- 8. Installments for Bike Sale 1 (Muhammad Ali)
INSERT INTO installments (bike_sale_id, customer_id, installment_no, due_date, amount, paid_amount, status, paid_date) VALUES
('d1111111-1111-1111-1111-111111111111', '11111111-1111-1111-1111-111111111111', 1, '2026-07-15', 50000.00, 50000.00, 'Paid', '2026-07-14'),
('d1111111-1111-1111-1111-111111111111', '11111111-1111-1111-1111-111111111111', 2, '2026-08-15', 50000.00, 0.00, 'Overdue', NULL),
('d1111111-1111-1111-1111-111111111111', '11111111-1111-1111-1111-111111111111', 3, '2026-09-15', 50000.00, 0.00, 'Unpaid', NULL);

-- 9. Vehicles Registry
INSERT INTO vehicles (customer_id, bike_id, engine_no, chassis_no, model_name, color, reg_no, reg_letter, reg_status, reg_date) VALUES
('11111111-1111-1111-1111-111111111111', 'b1111111-1111-1111-1111-111111111111', 'CG125E-982411', 'CG125C-982411', 'Honda CG 125', 'Red', 'LEK-26-8842', 'LEK', 'Registered', '2026-07-02'),
('22222222-2222-2222-2222-222222222222', 'b2222222-2222-2222-2222-222222222222', 'YBR125-781204', 'YBR125C-781204', 'Yamaha YBR 125G', 'Matte Black', NULL, NULL, 'Applied', '2026-08-25');

-- 10. Parts Sales & Items
INSERT INTO parts_sales (id, invoice_no, customer_name, customer_phone, sale_date, total_amount, payment_method, created_by, created_at) VALUES
('e1111111-1111-1111-1111-111111111111', 'INV-P2026-001', 'Usman Ghani', '0333-4567890', '2026-08-25', 4150.00, 'Cash', 'Bilal Hassan (Sales)', '2026-08-25 11:30:00')
ON CONFLICT DO NOTHING;

INSERT INTO parts_sale_items (parts_sale_id, part_id, part_name, barcode, quantity, unit_price, total_price) VALUES
('e1111111-1111-1111-1111-111111111111', 'c4444444-4444-4444-4444-444444444444', 'Heavy Duty Engine Oil 4T 20W50 1L', 'CO-40012', 2, 1650.00, 3300.00),
('e1111111-1111-1111-1111-111111111111', 'c1111111-1111-1111-1111-111111111111', 'Honda CG 125 Brake Pad Set', 'BP-10025', 1, 850.00, 850.00);

-- 11. Expenses
INSERT INTO expenses (voucher_no, expense_date, category, amount, description, payee, payment_method, created_by) VALUES
('VCH-2026-001', '2026-08-10', 'Utilities', 34500.00, 'Showroom Electricity Bill for July 2026', 'LESCO Electric Company', 'Cash', 'Shahid Raza (Manager)'),
('VCH-2026-002', '2026-08-25', 'Tea & Refreshment', 4200.00, 'Daily tea, coffee and customer refreshments', 'Al-Madina Bakers', 'Cash', 'Bilal Hassan (Sales)'),
('VCH-2026-003', '2026-08-01', 'Rent', 120000.00, 'Monthly Main Showroom Building Rent August 2026', 'Property Owner Malik Sb', 'Bank Transfer', 'Shahid Raza (Manager)')
ON CONFLICT DO NOTHING;

-- 12. Suppliers & Payables
INSERT INTO suppliers (id, name, contact_person, phone, address, total_payable) VALUES
('f1111111-1111-1111-1111-111111111111', 'Atlas Honda Genuine Parts Ltd', 'Bilal Ahmed', '042-35880000', 'Quaid-e-Azam Industrial Estate, Lahore', 85000.00),
('f2222222-2222-2222-2222-222222222222', 'Yamaha Spare Parts Hub', 'Kamran Khan', '021-34567890', 'Main S.I.T.E Area, Karachi', 42000.00)
ON CONFLICT DO NOTHING;

INSERT INTO supplier_payables (supplier_id, invoice_no, purchase_date, description, total_amount, paid_amount, status) VALUES
('f1111111-1111-1111-1111-111111111111', 'SUP-HON-8842', '2026-08-05', 'Bulk shipment of brake pads, cables and oil filters', 185000.00, 100000.00, 'Partial'),
('f2222222-2222-2222-2222-222222222222', 'SUP-YAM-1290', '2026-08-12', 'YBR Genuine Oil Filters & Gaskets', 42000.00, 0.00, 'Unpaid');

-- 13. Audit Logs
INSERT INTO audit_logs (user_name, action, entity, entity_id, details) VALUES
('System Administrator', 'DATABASE_INITIALIZATION', 'SYSTEM', 'SYS-001', 'Showroom schema and initial catalog created successfully'),
('Bilal Hassan (Sales)', 'BIKE_SALE_CREATED', 'BIKE_SALE', 'd1111111-1111-1111-1111-111111111111', 'Sold Honda CG 125 to Muhammad Ali (INV-B2026-001) on 3 monthly installments'),
('Zain Ul Abidin (Stock)', 'STOCK_RECEIVED', 'INVENTORY', 'c1111111-1111-1111-1111-111111111111', 'Scanned barcode BP-10025: Received 50 units Honda CG 125 Brake Pads'),
('Bilal Hassan (Sales)', 'PARTS_SALE_CREATED', 'PARTS_SALE', 'e1111111-1111-1111-1111-111111111111', 'Completed POS sale INV-P2026-001 for PKR 4,150');

import fs from 'fs';
import { execSync } from 'child_process';

const sqlContent = fs.readFileSync('seed_data.sql', 'utf8');

const resetTablesSQL = `
TRUNCATE audit_logs, supplier_payables, suppliers, expenses, parts_sale_items, parts_sales, vehicles, installments, bike_sales, inventory_transactions, products_parts, bikes, bike_models, customers, app_users RESTART IDENTITY CASCADE;
`;

console.log('Resetting database tables...');
try {
  execSync(`npx -y @insforge/cli db query "${resetTablesSQL.replace(/\n/g, ' ')}"`, { stdio: 'inherit' });
} catch (e) {
  console.log('Reset info:', e.message);
}

console.log('Executing complete seed_data.sql via db import...');
try {
  execSync(`npx -y @insforge/cli db import seed_data.sql`, { stdio: 'inherit' });
  console.log('Seed completed successfully!');
} catch (err) {
  console.error('Seed import error:', err.message);
}

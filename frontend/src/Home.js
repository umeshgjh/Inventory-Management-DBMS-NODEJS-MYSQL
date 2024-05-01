import React from 'react';
import './Home.css';

function Home() {
  return (
    <div className="home-container">
      <h1>Welcome to Inventory Management</h1>
      <div className="image-grid">
        <img src={require('./360_F_304001532_vVJA7cehLhsToMtHfJBI7Je9oCCmS4pD.webp')} alt="1" />
        <img src={require('./depositphotos_107058154-stock-photo-interior-of-migros-supermarket.webp')} alt="2" />
        <img src={require('./grocery-store-aisle.webp')} alt="3" />
        <img src={require('./happy-man-working-at-a-supermarket-restocking-the-shelves.webp')} alt="4" />
      </div>

      <h2>Database Tables</h2>
      <ul>
        <li>
          <strong>Products</strong>: Stores information about products,
          including ID, name, description, category, supplier, price, and
          quantity in stock.
        </li>
        <li>
          <strong>Suppliers</strong>: Stores information about suppliers,
          including ID, name, contact information, address, and contact person.
        </li>
        <li>
          <strong>InventoryTransactions</strong>: Stores records of inventory
          transactions, such as purchases, sales, and adjustments.
        </li>
        <li>
          <strong>Sales</strong>: Stores records of sales transactions.
        </li>
        <li>
          <strong>Users</strong>: Stores user information, including ID,
          username, password, and role (cashier, manager, or administrator).
        </li>
        <li>
          <strong>Orders</strong>: Stores information about orders placed with
          suppliers, including order ID, supplier ID, order date, expected
          delivery date, and status.
        </li>
      </ul>

      <h2>Sample Data</h2>
      <p>
        The SQL code provided includes sample data for each of the tables,
        allowing you to explore and test the inventory management system.
      </p>

      <p>
        Feel free to navigate through the application to learn more about
        various features and functionalities.
      </p>
    </div>
  );
}

export default Home;

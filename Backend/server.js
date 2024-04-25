const express = require('express');
const mysql = require('mysql2/promise');
const cors = require('cors');

const app = express();

// Middleware
app.use(cors());
app.use(express.json());

const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: 'London@2004',
  database: 'project',
  port: 3306,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});


// API endpoint to fetch all products
app.get('/api/Products', async (req, res) => {
  try {
    const connection = await pool.getConnection();
    const [rows] = await connection.query('SELECT * FROM Products');
    connection.release();
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).send('Server error');
  }
});

// API endpoint to add a new product
app.post('/api/Products', async (req, res) => {
  try {
    const connection = await pool.getConnection();
    const { ProductName, Description, Category, SupplierID, Price, QuantityInStock } = req.body;
    const [result] = await connection.query(
      'INSERT INTO Products (ProductName, Description, Category, SupplierID, Price, QuantityInStock) VALUES (?, ?, ?, ?, ?, ?)',
      [ProductName, Description, Category, SupplierID, Price, QuantityInStock]
    );
    connection.release();
    res.json({ id: result.insertId });
  } catch (err) {
    console.error(err);
    res.status(500).send('Server error');
  }
});

// API endpoint to update a product
app.put('/api/Products/:id', async (req, res) => {
  try {
    const connection = await pool.getConnection();
    const { ProductName, Description, Category, SupplierID, Price, QuantityInStock } = req.body;
    const [result] = await connection.query(
      'UPDATE Products SET ProductName = ?, Description = ?, Category = ?, SupplierID = ?, Price = ?, QuantityInStock = ? WHERE ProductID = ?',
      [ProductName, Description, Category, SupplierID, Price, QuantityInStock, req.params.id]
    );
    connection.release();
    if (result.affectedRows === 0) {
      res.status(404).send('Product not found');
    } else {
      res.json({ message: 'Product updated successfully' });
    }
  } catch (err) {
    console.error(err);
    res.status(500).send('Server error');
  }
});

// API endpoint to delete a product
app.delete('/api/Products/:id', async (req, res) => {
  try {
    const connection = await pool.getConnection();
    const [result] = await connection.query(
      'DELETE FROM Products WHERE ProductID = ?',
      [req.params.id]
    );
    connection.release();
    if (result.affectedRows === 0) {
      res.status(404).send('Product not found');
    } else {
      res.json({ message: 'Product deleted successfully' });
    }
  } catch (err) {
    console.error(err);
    res.status(500).send('Server error');
  }
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

import React, { useEffect, useState } from 'react';
import axios from 'axios';
import './products.css';

const Product = () => {
  const [products, setProducts] = useState([]);
  const [newProduct, setNewProduct] = useState({
    ProductName: '',
    Description: '',
    Category: '',
    SupplierID: '',
    Price: '',
    QuantityInStock: '',
  });
  const [editingProduct, setEditingProduct] = useState(null);

  useEffect(() => {
    fetchProducts();
  }, []);

  const fetchProducts = async () => {
    try {
      const response = await axios.get('http://localhost:5000/api/Products');
      setProducts(response.data);
    } catch (error) {
      console.error('Error fetching products:', error);
    }
  };

  const handleInputChange = (e) => {
    setNewProduct({ ...newProduct, [e.target.name]: e.target.value });
  };

  const handleAddProduct = async () => {
    try {
      await axios.post('http://localhost:5000/api/Products', newProduct);
      setNewProduct({
        ProductName: '',
        Description: '',
        Category: '',
        SupplierID: '',
        Price: '',
        QuantityInStock: '',
      });
      fetchProducts();
    } catch (error) {
      console.error('Error adding product:', error);
    }
  };

  const handleEditProduct = (product) => {
    setEditingProduct(product);
  };

  const handleCancelEdit = () => {
    setEditingProduct(null);
  };

  const handleUpdateProduct = async (product) => {
    try {
      await axios.put(`http://localhost:5000/api/Products/${product.ProductID}`, product);
      fetchProducts();
      setEditingProduct(null); // Reset editing state after successful update
    } catch (error) {
      console.error('Error updating product:', error);
    }
  };

  const handleDeleteProduct = async (productId) => {
    try {
      await axios.delete(`http://localhost:5000/api/Products/${productId}`);
      fetchProducts();
    } catch (error) {
      console.error('Error deleting product:', error);
    }
  };

  return (
    <div>
      <h1>Products</h1>
      <table>
        <thead>
          <tr>
            <th>ProductID</th>
            <th>Product Name</th>
            <th>Description</th>
            <th>Category</th>
            <th>Supplier ID</th>
            <th>Price</th>
            <th>Quantity in Stock</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {products.map((product) => (
            <tr key={product.ProductID}>
              <td>{product.ProductID}</td>
              <td>{editingProduct && editingProduct.ProductID === product.ProductID ? (
                <input
                  type="text"
                  name="ProductName"
                  value={editingProduct.ProductName}
                  onChange={(e) => setEditingProduct({ ...editingProduct, ProductName: e.target.value })}
                />
              ) : (
                product.ProductName
              )}</td>
              <td>{editingProduct && editingProduct.ProductID === product.ProductID ? (
                <input
                  type="text"
                  name="Description"
                  value={editingProduct.Description}
                  onChange={(e) => setEditingProduct({ ...editingProduct, Description: e.target.value })}
                />
              ) : (
                product.Description
              )}</td>
              <td>{product.Category}</td>
              <td>{product.SupplierID}</td>
              <td>{editingProduct && editingProduct.ProductID === product.ProductID ? (
                <input
                  type="text"
                  name="Price"
                  value={editingProduct.Price}
                  onChange={(e) => setEditingProduct({ ...editingProduct, Price: e.target.value })}
                />
              ) : (
                product.Price
              )}</td>
              <td>{editingProduct && editingProduct.ProductID === product.ProductID ? (
                <input
                  type="text"
                  name="QuantityInStock"
                  value={editingProduct.QuantityInStock}
                  onChange={(e) => setEditingProduct({ ...editingProduct, QuantityInStock: e.target.value })}
                />
              ) : (
                product.QuantityInStock
              )}</td>
              <td>
                {editingProduct && editingProduct.ProductID === product.ProductID ? (
                  <div>
                    <button onClick={() => handleUpdateProduct(editingProduct)}>Save</button>
                    <button onClick={handleCancelEdit}>Cancel</button>
                  </div>
                ) : (
                  <button onClick={() => handleEditProduct(product)}>Edit</button>
                )}
                <button onClick={() => handleDeleteProduct(product.ProductID)}>Delete</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
      <h2>Add New Product</h2>
      <input
        type="text"
        name="ProductName"
        placeholder="Product Name"
        value={newProduct.ProductName}
        onChange={handleInputChange}
      />
      <input
        type="text"
        name="Description"
        placeholder="Description"
        value={newProduct.Description}
        onChange={handleInputChange}
      />
      <input
        type="text"
        name="Category"
        placeholder="Category"
        value={newProduct.Category}
        onChange={handleInputChange}
      />
      <input
        type="text"
        name="SupplierID"
        placeholder="Supplier ID"
        value={newProduct.SupplierID}
        onChange={handleInputChange}
      />
      <input
        type="text"
        name="Price"
        placeholder="Price"
        value={newProduct.Price}
        onChange={handleInputChange}
      />
      <input
        type="text"
        name="QuantityInStock"
        placeholder="Quantity in Stock"
        value={newProduct.QuantityInStock}
        onChange={handleInputChange}
      />
      <button onClick={handleAddProduct}>Add Product</button>
    </div>
  );
};

export default Product;

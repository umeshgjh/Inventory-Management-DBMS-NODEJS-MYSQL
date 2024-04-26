import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { BrowserRouter as Router, Route, Link, Routes } from 'react-router-dom';
import Footer from './Footer';
import Home from './Home';
import About from './About';
import Products from './products';
import Login from './Login';
import Register from './Register';
import './App.css';

function App() {
  const [data, setData] = useState([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const result = await axios.get('http://localhost:5000/api/products');
        setData(result.data);
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    };
    fetchData();
  }, []);

  return (
    <Router>
      <div className="App">
        <header
          className="Header"
          style={{
            backgroundColor: '#333',
            color: '#fff',
            padding: '10px',
            display: 'flex',
            justifyContent: 'space-between',
            alignItems: 'center',
          }}
        >
          <div style={{ marginLeft: '20px' }}>Inventory Management for DBMS Review</div>
          <nav>
            <ul
              className="NavList"
              style={{
                display: 'flex',
                listStyle: 'none',
                padding: 0,
                marginRight: '20px',
              }}
            >
              <li className="NavItem">
                <Link to="/" className="NavLink" style={{ color: '#fff', marginRight: '20px' }}>
                  Home
                </Link>
              </li>
              <li className="NavItem">
                <Link to="/about" className="NavLink" style={{ color: '#fff', marginRight: '20px' }}>
                  About
                </Link>
              </li>
              <li className="NavItem">
                <Link
                  to="/products"
                  className="NavLink"
                  style={{ color: '#fff', marginRight: '20px' }}
                >
                  Products
                </Link>
              </li>
              <li className="NavItem">
                <Link to="/login" className="NavLink" style={{ color: '#fff', marginRight: '20px' }}>
                  Login
                </Link>
              </li>
              <li className="NavItem">
                <Link to="/register" className="NavLink" style={{ color: '#fff' }}>
                  Register
                </Link>
              </li>
            </ul>
          </nav>
        </header>
        <div className="content">
          <Routes>
            <Route path="/" element={<Home data={data} />} />
            <Route path="/about" element={<About data={data} />} />
            <Route path="/products" element={<Products data={data} />} />
            <Route path="/login" element={<Login data={data} />} />
            <Route path="/register" element={<Register data={data} />} />
          </Routes>
        </div>
        <Footer />
      </div>
    </Router>
  );
}

export default App;
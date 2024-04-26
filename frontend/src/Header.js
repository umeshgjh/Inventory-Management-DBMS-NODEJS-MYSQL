// Header.js
import React from 'react';
import { Link } from 'react-router-dom';
import './Header.css';

function Header() {
  return (
    <header className="Header">
      <nav>
        <ul className="NavList">
          <li className="NavItem"><Link to="/" className="NavLink">Home</Link></li>
          <li className="NavItem"><Link to="/about" className="NavLink">About</Link></li>
          <li className="NavItem"><Link to="/login" className="NavLink">Login</Link></li>
          <li className="NavItem"><Link to="/register" className="NavLink">Register</Link></li>
        </ul>
      </nav>
    </header>
  );
}

export default Header;
import React from 'react';
import { Link } from 'react-router-dom';
import './Header.css';

function Header() {
  return (
    <header className="header"> {/* Change className to "header" */}
      <nav>
        <ul className="nav-list"> {/* Change className to "nav-list" */}
          <li className="nav-item"> {/* Change className to "nav-item" */}
            <Link to="/" className="nav-link">Home</Link> {/* Change className to "nav-link" */}
          </li>
          <li className="nav-item">
            <Link to="/about" className="nav-link">About</Link>
          </li>
          <li className="nav-item">
            <Link to="/login" className="nav-link">Login</Link>
          </li>
          <li className="nav-item">
            <Link to="/register" className="nav-link">Register</Link>
          </li>
        </ul>
      </nav>
    </header>
  );
}

export default Header;

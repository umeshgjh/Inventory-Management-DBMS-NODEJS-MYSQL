import React from 'react';
import './Footer.css';

function Footer() {
  return (
    <footer className="footer">
      <div className="container">
        <span className="text-muted">&copy; {new Date().getFullYear()} - Umesh GJH</span>
      </div>
    </footer>
  );
}

export default Footer;
// Register.js
import React from 'react';
import './Register.css';

function Register() {
  return (
    <div className="register-container">
      <h1>Register</h1>
      <form>
        <div className="form-group">
          <label htmlFor="fullName">Full Name:</label>
          <input type="text" id="fullName" name="fullName" required />
        </div>
        <div className="form-group">
          <label htmlFor="email">Email:</label>
          <input type="email" id="email" name="email" required />
        </div>
        <div className="form-group">
          <label htmlFor="contactNumber">Contact Number:</label>
          <input type="tel" id="contactNumber" name="contactNumber" required />
        </div>
        <div className="form-group">
          <label htmlFor="userType">User Type:</label>
          <div className="custom-select">
            <select id="userType" name="userType" required>
              <option value="">Choose one option</option>
              <option value="supplier">Supplier</option>
              <option value="employee">Employee</option>
            </select>
          </div>
        </div>
        <div className="form-group">
          <label htmlFor="password">Password:</label>
          <input type="password" id="password" name="password" required />
        </div>
        <div className="form-group">
          <label htmlFor="confirmPassword">Confirm Password:</label>
          <input type="password" id="confirmPassword" name="confirmPassword" required />
        </div>
        <button type="submit" className="register-btn">Register</button>
      </form>
    </div>
  );
}

export default Register;
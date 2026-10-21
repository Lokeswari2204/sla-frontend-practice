import { useState } from 'react'
import heroImg from './assets/hero.png'
import reactLogo from './assets/react.svg'
import viteLogo from './assets/vite.svg'
import './App.css'
import Home from './pages/Home'
import About from './pages/About'
import Contact from './pages/Contact'
import { Link, Routes, Route } from 'react-router-dom';
import Products from './pages/Products'
import Login from './pages/Login'
import Dashboard from './pages/Dashboard'

function App() {
  

  return (
    <>
      <div>
        <h1>My Website</h1>
        <nav>
          <Link to="/">Home</Link> { " | "}
          <Link to="/about">About</Link> { " | "}
          <Link to="/products">Products</Link> { " | "}
          <Link to="/contact">Contact</Link> { " | "}
          <Link to="/login">Login</Link> { " | "}
          <Link to="/dashboard">Dashboard</Link>
        </nav>

        <hr></hr>

        <Routes>
          <Route path="/" element={<Home/>} />
          <Route path="/about" element={<About/>}/>
          <Route path="/products" element={<Products/>} />
          <Route path="/contact" element={<Contact/>}/>
          <Route path="/login" element={<Login/>}/>
          <Route path="/dashboard" element={<Dashboard/>}/>
        </Routes>
      </div>
    </>
  )
}

export default App

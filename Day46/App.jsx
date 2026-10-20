import { useState } from 'react'
import heroImg from './assets/hero.png'
import reactLogo from './assets/react.svg'
import viteLogo from './assets/vite.svg'
import './App.css'
import ProfileCard from './Components/ProfileCard'
import Navbar from './Components/Navbar'
import Products from './Components/Products'

function App() {
  

  return (
    <>
      <Navbar/>
      <ProfileCard/>
      <Products/>
      
    </>
  )
}

export default App

import { useState } from 'react'
import heroImg from './assets/hero.png'
import reactLogo from './assets/react.svg'
import viteLogo from './assets/vite.svg'
import './App.css'
import Student from './Components/Student.jsx';
import LoginStatus from './Components/LoginStatus.jsx';
import Result from './Components/Result.jsx';
import Product from './Components/Product.jsx'
import AgeCheck from './Components/AgeCheck.jsx'

function App() {
  

  return (
    <>
      <Student/>
      <LoginStatus/>
      <Result />
      <Product />
      <AgeCheck />
    </>
  )
}

export default App

import { useState } from 'react'
import heroImg from './assets/hero.png'
import reactLogo from './assets/react.svg'
import viteLogo from './assets/vite.svg'
import './App.css'
import LoginForm from './Components/LoginForm'
import Student from './Components/Student'
import CourseSelection from './Components/CourseSelection'
import CheckBox from './Components/CheckBox'
import Registration from './Components/Registration'

function App() {
  

  return (
    <>
      <LoginForm/>
      <Student/>
      <CourseSelection/>
      <CheckBox/>
      <br></br><br></br>
      <Registration/>
    </>
  )
}

export default App

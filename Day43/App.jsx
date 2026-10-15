import { useState } from 'react'
import heroImg from './assets/hero.png'
import reactLogo from './assets/react.svg'
import viteLogo from './assets/vite.svg'
import './App.css'
import Employee from './Components/Employee'
import Product from './Components/Product'
import Customer from './Components/Customer'

function App() {
  //1
  let username="";
  function handleSubmit(){
    console.log("User Input: "+ username)
  }
  function handleChange(event){
    username = event.target.value;
  }
  
 //3
 function showMessage(name)
 {
     console.log("Student Name:" + name)
 }

 //4
 function handleClick() {
    console.log("Button clicked");
  }

  function handleMouseEnter() {
    console.log("Mouse entered");
  }

  function handleMouseLeave() {
    console.log("Mouse left");
  }

  function handleDoubleClick() {
    console.log("Button double clicked");
  }

  //5
  function handleBlur(event){
    console.log("User Input: " + event.target.value)
  }
  return (
    <>
    <div>
      {/* 1 */}
     <input type="text" placeholder="Enter anything" onChange={handleChange} />
     <button onClick={handleSubmit} >Submit</button>
      <br></br>
      {/* 3 */}
     <button onClick={() => showMessage("Arun")}>Student 1</button>
     <br></br>
     {/* 4 */}
     <button onClick={handleClick} onMouseEnter={handleMouseEnter} onMouseLeave={handleMouseLeave} onDoubleClick={handleDoubleClick}>Click or hover to See Multiple events</button>
     <br></br>
     {/* 5 */}
     <input type="text" onBlur={handleBlur} placeholder='Enter anything'/>
    </div>
   <hr></hr>



    <Employee/>
    <Product/>
    <Customer />
    </>
  )
}

export default App

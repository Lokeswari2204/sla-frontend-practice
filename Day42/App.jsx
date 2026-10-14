import { useState } from 'react'
import heroImg from './assets/hero.png'
import reactLogo from './assets/react.svg'
import viteLogo from './assets/vite.svg'
import './App.css'
import ProfileCard from './Components/ProfileCard.jsx'
import Button from './Components/Button.jsx'
import Card from './Components/Card.jsx'

function App() {
  
  return (
    <>
      <ProfileCard name="John" age={21} role="Developer">
        <p>Likes React and Javascript</p>
      </ProfileCard>
      <ProfileCard name="Alice" age={23} role="Designer">
        <p>Loves UI Design and Creativity</p>
      </ProfileCard>
      <ProfileCard name="Alex" age={22} role="Tester">
        <p>Enjoys Testing and finding bugs</p>
      </ProfileCard>


      <Button color="blue" size="large"> Submit </Button>
      <Button color="green" size="medium"> Save </Button>
      <Button color="red" size="small"> Clear </Button>


        <Card title="Product" footer="Rs.999">
           <p>This is a great product.</p>
            <p>High quality and affordable.</p>
        </Card>

        <Card title="About" footer="Learn more">
          <p>We are a software development company.</p>
          <p>We build useful web applications.</p>
        </Card>

        <Card title="Contact" footer="Contact Us">
          <p>Email: example@gmail.com</p>
          <p>Phone: 9876543210</p>
        </Card>
    


    </>
  )
}

export default App

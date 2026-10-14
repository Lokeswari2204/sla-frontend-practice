export default function LoginStatus()
{
    let isLoggedIn = true;
  if(isLoggedIn)
  {
    return <h2>Welcome User!</h2>
  }
  else{
    return <h2>Please Login</h2>
  }
}
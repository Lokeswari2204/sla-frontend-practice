import { useNavigate } from "react-router-dom";

function Login()
{
    const navigate = useNavigate();
    return (
        <div>
            <h2>Login Page</h2>
            <input type="text" placeholder="Enter Username" />
            <br></br>
            <input type="password" placeholder="Enter password"/>
            <br></br>
            <button onClick={() => navigate("/dashboard") }>Login</button>
        </div>
    );
}
export default Login;
import {useState} from "react";

export default function LoginForm()
{
    const [username, setUsername] = useState("");
    const [password, setPassword] = useState("");

    function handleSubmit(event)
    {
        event.preventDefault();
        alert("Username: " + username);
    }

    return (
        <div>
            <h2>Login Form</h2>
            <form onSubmit={handleSubmit}>
                <label>Username:   </label>
                <input type="text" value={username} placeholder="Enter Username" onChange={(e) => setUsername(e.target.value)} required/>
                <br></br>
                <label>Password:   </label>
                <input type="password" value={password} placeholder="Enter Password" onChange={(e) => setPassword(e.target.value)} required/>
                <br></br>
                <button type="submit">Login</button>

            </form>
        </div>
    )
}
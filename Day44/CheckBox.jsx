import {useState} from "react";

export default function CheckBox()
{
    const [agree, setAgree] = useState("");
    function handleSubmit(e)
    {
        e.preventDefault();
        alert("Form submitted successfully")
    }
    return (
        <div>
           <form onSubmit={handleSubmit}>
            <label>
            <input type="checkbox" checked={agree} onChange={(e) => setAgree(e.target.checked)}/>
            I agree to the Terms and Conditions
            </label>

            <br></br>
            <button type="submit" disabled={!agree}>Submit</button>
           </form>
        </div>
    )
}
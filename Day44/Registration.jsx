import { useState } from "react";

export default function Registration()
{
    const [name, setName] = useState("");
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [gender, setGender] = useState("");
    const [skills, setSkills] = useState("");
    const [course, setCourse] = useState("");
    const [address, setAddress] = useState("");

    function handleSubmit(e)
    {
        e.preventDefault();
        alert("Form submitted successfully")
        console.log("Name: " + name);
        console.log("Email: " + email);
        console.log("Password: " + password);
        console.log("Gender: ", gender);
        console.log("Skills: " + skills);
        console.log("Course: " + course);
        console.log("Address: " + address);
    }

    function handleSkillChange(e)
    {
        const skill = e.target.value;
        if(e.target.checked)
        {
            setSkills([...skills, skill]);
        }
        else{
            setSkills(
                skills.filter(item => item !== skill)
            );
        }
    }

    return (
        <div>
            <h2>Student Registration</h2><br></br><br></br>
            <form onSubmit={handleSubmit}>
                
                <label>Name:  </label>
                <input type="text" value={name} onChange={(e) => setName(e.target.value)} placeholder="Enter your name"/>
                 <br></br><br></br>

                <label>Email:  </label>
                <input type="email" value={email} onChange={(e) => setEmail(e.target.value)} placeholder="Enter your email"/>
                <br></br><br></br>

                <label>Password:  </label>
                <input type="password" value={password} onChange={(e) => setPassword(e.target.value)} placeholder="Enter your password"/>
                 <br></br><br></br>

                <label>Gender:  </label>
                <input type="radio" name="gender" value="Male" checked={gender==="Male"} onChange={(e) => setGender(e.target.value)}/>
                <label>Male</label>
                <input type="radio" name="gender" value="Female" checked={gender==="Female"} onChange={(e) => setGender(e.target.value)}/>
                <label>Female</label>
                <br></br><br></br>

                <label>Skills:  </label>
                <input type="checkbox" value="HTML" checked={skills.includes("HTML")} onChange={handleSkillChange}/>
                <label>HTML</label>
                <input type="checkbox" value="CSS" checked={skills.includes("CSS")} onChange={handleSkillChange}/>
                <label>CSS</label>
                <input type="checkbox" value="JavaScript" checked={skills.includes("JavaScript")} onChange={handleSkillChange} />
                <label >JavaScript</label>
                <input type="checkbox" value="React" checked={skills.includes("React")} onChange={handleSkillChange} />
                <label >React</label>
                <br></br><br></br>

                <label>Course:  </label>
                <select value={course} onChange={(e) => setCourse(e.target.value)}>
                    <option value="">Select Course</option>
                    <option value="Java">Java</option>
                    <option value=".NET">.NET</option>
                    <option value="Python">Python</option>
                    <option value="React">React</option>
                </select>
                <br></br><br></br>

                <label>Address:  </label><br></br>
                <textarea rows="5" cols="30" value={address} onChange={(e) => setAddress(e.target.value)} placeholder="Enter your address"></textarea>
                <br></br><br></br>

                <button type="submit">Register</button>
                <button type="reset">Reset</button>

            </form>
        </div>
    )
}
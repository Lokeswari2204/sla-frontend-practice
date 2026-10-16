import { useState } from "react";
export default function Student()
{
    const [name, setName] = useState("");
    const [age, setAge] = useState("");
    const [department, setDepartment] = useState("");

    const [student, setStudent] = useState(null);

    function handleSubmit(event)
    {
        event.preventDefault();
        setStudent({
            name: name,
            age: age,
            department: department
        });

    }

    return(
        <div>
            <form onSubmit={handleSubmit}>
                <br></br>
                <label>Student Name:  </label>
                <input type="text" value={name} onChange={(e)=> setName(e.target.value)} required/>
                <br></br>
                <label>Age: </label>
                <input type="number" value={age} onChange={(e) => setAge(e.target.value)} required/>
                <br></br>
                <label>Department:  </label>
                <input type="text" value={department} onChange={(e) => setDepartment(e.target.value)} required/>
                <br></br>
                <button type="submit">Submit</button>
            </form>

            { student && (
                <div>
                    <h3>Student Information: </h3>
                    <p>Name: {student.name} </p>
                    <p>Age: {student.age}</p>
                    <p>Department: {student.department}</p>
                    <br></br>
                </div>
            )}
        </div>
    )
}
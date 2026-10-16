import {useState} from "react"

export default function CourseSelection()
{
    const [course, setCourse] = useState("")
    return (
        <div>
            <h2>Course Selection: </h2>
            <form>
            <label>Selected Course: </label>

            <select value={course} onChange={(e)=> setCourse(e.target.value)}>
                <option value="">Choose a Course</option>
                <option value="React">React</option>
                <option value=".NET">.NET</option>
                <option value="Java">Java</option>
            </select>

            <h4>Selected Course: {course}</h4>
            </form>
        </div>
    )
}
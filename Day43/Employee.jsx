import {useState} from "react"

function Employee()
{
    const [empid, setEmpid] = useState(101);
    const [empname, setEmpname] = useState("Alice");
    const [salary, setSalary] = useState(40000)
    const [desgn, setDesgn] = useState("Developer");
    const [deptno, setDeptno] = useState(10)
   return (
    <div>
        <h2>Employee Details</h2>
        <p>Employee ID: {empid} </p>
        <p>Employee Name: {empname}</p>
        <p>Salary: {salary}</p>
        <p>Designation: {desgn}</p>
        <p>Department Number: {deptno}</p>

    </div>
   )
}
export default Employee
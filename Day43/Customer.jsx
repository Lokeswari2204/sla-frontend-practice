import { useState } from "react";

export default function Customer() {
    const [customers, setCustomers] = useState(["Arun", "Bob", "Sam"]);
    const [name, setName] = useState("")
    function addCustomer()
    {
        setCustomers([...customers, name]);
    }
    function deleteCustomer(index)
    {
        setCustomers(customers.filter((customer, i) => i !== index ))
    }
    return (
        <div>
           <h2>Customer Details</h2>
           <input type="text" value={name} placeholder="Enter customer name" onChange={(event) => setName(event.target.value)} />

           <button onClick={addCustomer}>Add customer</button>

           <h3>Customer List</h3>
           {customers.map((customer, index) => (
            <p key={index}>{customer} {" "} <button onClick={() => deleteCustomer(index)}> Delete
            </button>
            </p>
           ))}

        </div>
    )

}
import React from "react";

function ProfileCard(props)
{
    return (
        <div>
            <h2>Profile Card</h2>
            <p>Name: {props.name}</p>
            <p>Age: {props.age}</p>
            <p>Role: {props.role}</p>
            {props.children}
            <hr/>

        </div>
    )
}
export default ProfileCard
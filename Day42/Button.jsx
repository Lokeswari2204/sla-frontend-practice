import React from 'react'
import { Children } from 'react'

export default function Button({color, size, children})
{
    let buttonStyle = {
        backgroundColor: color,
        color: "white",
        padding: size === "small" ? "5px 10px" : size === "medium" ? "10px 20px" : "15px 30px",
        fontSize: size === "small" ? "12px" : size === "medium" ? "16px" : "20px",
        margin: "10px",
        borderRadius: "5px"
    };

    return (
        <>
        <button style={buttonStyle}>
            {children}
        </button>
        </>
    )
}
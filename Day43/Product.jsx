import { useState } from "react";

export default function Product()
{
    const [product, setProduct] = useState({
        name: "Laptop",
        price: 50000,
        brand: "Dell",
        quantity: 2
    });

    return (
        <div>
            <h2>Product Details</h2>
            <p>Product Name: {product.name}</p>
            <p>Price: Rs.{product.price}</p>
            <p>Brand: {product.brand}</p>
            <p>Quantity:{product.quantity}</p>

            <button onClick={() => setProduct({name: "Mobile", price: 25000, brand: "Samsung", quantity: 3 })}>Change Product</button>
        </div>
    )
}
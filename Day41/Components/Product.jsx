export default function Product()
{
    let isAvailable = false;
    return (
    <div>
    <h2>Product Details</h2>
    {isAvailable ? (<h4>Product in Stock</h4>) : (<h4>Out of Stock</h4>)}
    </div>
    )
}
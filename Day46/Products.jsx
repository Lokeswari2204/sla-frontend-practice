export default function Products()
{
    const products = [
    {
      id: 1,
      name: "Headphones",
      price: 1499,
      rating: 4.5,
      image: "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400"
    },
    {
      id: 2,
      name: "Smart Watch",
      price: 2499,
      rating: 4.2,
      image: "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400"
    },
    {
      id: 3,
      name: "Camera",
      price: 8999,
      rating: 4.8,
      image: "https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=400"
    },
    {
      id: 4,
      name: "Shoes",
      price: 1999,
      rating: 4.3,
      image: "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400"
    },
    {
      id: 5,
      name: "Backpack",
      price: 1299,
      rating: 4.1,
      image: "https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400"
    },
    {
      id: 6,
      name: "Sunglasses",
      price: 999,
      rating: 4.4,
      image: "https://images.unsplash.com/photo-1511499767150-a48a237f0083?w=400"
    }
  ];
  return (
    <div className="min-h-screen bg-gray-100 p-6">
        <h1 className="text-3xl font-bold text-center mb-8">Our Products</h1>

        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
           {products.map((product) => (
            <div key={product.id} className="bg-white rounded-xl shadow-md overflow-hidden">
                <img src={product.image} alt={product.name} className="w-full h-52 object-cover"/>
                <div className="p-5">
                    <h2 className="text-xl font-bold">{product.name}</h2>
                    <p className="text-green-600 text-lg font-semibold mt-2">Rs.{product.price}</p>

                    <p className="text-yellow-600 mt-2">{product.rating} / 5</p>
                    <button className="w-full bg-blue-600 text-white py-2 rounded-lg mt-4 hover:bg-blue-800">Add to Cart</button>
                </div>
            </div>
           ))}   
        </div>
    </div>
  )
}
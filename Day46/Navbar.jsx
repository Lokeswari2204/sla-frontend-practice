export default function Navbar()
{
    return (
        <nav className="bg-blue-700 text-white p-4">
            <div className="flex flex-wrap items-center justify-between gap-4">
                <h1 className="text-2xl font-bold">MyWebsite</h1>
                <div className="flex flex-wrap items-center gap-5">
                    <a href="#home" className="hover:text-yellow-300">Home</a>
                    <a href="#about" className="hover:text-yellow-300">About</a>
                    <a href="#services" className="hover:text-yellow-300">Services</a>
                    <a href="#contact" className="hover:text-yellow-300">Contact</a>
                    <button className="bg-white text-blue-700 px-4 py-2 rounded-lg hover:bg-yellow-300">Login</button>
                </div>
            </div>
        </nav>

    )
}
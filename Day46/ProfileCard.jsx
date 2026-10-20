export default function ProfileCard()
{
    return(
        <div className="min-h-screen bg-gray-100 flex justify-center items-center">
            <div className="bg-white w-80 p-6 rounded-xl shadow-lg text-center">
                <img src="logo.png" alt="Profile" className="w-28 h-28 rounded-full mx-auto object-cover"/>
                <h2 className="text-2xl font-bold mt-4">Shama</h2>
                <p className="text-blue-600 font-semibold mt-2">Web Developer</p>
                <p className="text-gray-600 mt-3">Passionate about web development and learning new technologies.</p>
                <button className="bg-blue-500 text-white px-6 rounded-lg mt-5 hover:bg-blue-700">Follow</button>
            </div>
        </div>
    )
}
export default function Result()
{
    let mark = 75;
    return (
        <div>
        <h2>Student Result</h2>
        <p>Marks:{mark}</p>
        { mark > 35 ? (<h3>Pass</h3>) : (<h3>Fail</h3>)}
        </div>
    );
}
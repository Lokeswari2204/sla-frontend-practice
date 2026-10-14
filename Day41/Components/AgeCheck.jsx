export default function AgeCheck()
{
    let age = 20;
    if (age >= 18)
        return <h3>Eligible to Vote</h3>;
    else
        return <h3>Not Eligible to Vote</h3>;
}
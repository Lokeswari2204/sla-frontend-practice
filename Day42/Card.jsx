export default function Card({title,footer,children})
{
    return (
        <div className="card">
            <h2>{title}</h2>
            <div className="card-content">
                {children}
            </div>
            <div className="card-footer">
                {footer}
            </div>
        </div>
    );
}
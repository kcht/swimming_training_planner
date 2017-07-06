const ShowMoreLessSection = ({ contentCollapsed, onClickMore, onClickLess }) => {

    return (
        <div className="show-more-less">
            { (contentCollapsed && ( <a onClick={onClickMore} className="show-more">Show more</a> )) }
            { (!contentCollapsed && ( <a onClick={onClickLess} className="show-less">Show less</a> ))}
        </div>
    )
}

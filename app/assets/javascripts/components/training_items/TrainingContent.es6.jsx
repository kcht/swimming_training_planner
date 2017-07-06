class TrainingContent extends React.Component {
    constructor(props) {
        super(props)
        this.fullContent = this.fullContentInLines(this.props.content)
        this.collapsedContent = this.lessContentInLines(this.props.content)
        this.contentNeedsCollapsing= this.fullContent.length > this.props.minimum_lines_to_display

        this.state = {
            showingCollapsedContent: true,
            content: this.collapsedContent
        }

        this.showLess = this.showLess.bind(this)
        this.showMore = this.showMore.bind(this)
    }

    showMore() {
        this.setState({showingCollapsedContent: false, content: this.fullContent})
    }

    showLess() {
        this.setState({showingCollapsedContent: true, content: this.collapsedContent})
    }

    lessContentInLines(content) {
        minimumLinesToDisplay = this.props.minimum_lines_to_display
        lines = content.split("\n")
        if (lines.length <= minimumLinesToDisplay) {
            return lines
        }
        else {
            return lines.slice(0, minimumLinesToDisplay)
        }
    }

    fullContentInLines(content) {
        return content.split("\n")
    }

    render() {
        exercise_items = this.state.content.map(function (i) {
            return (
                <div className='exercise' >{i}</div>
            );
        });

        return(

            <div>
                <div className="exercises">{exercise_items}</div>
                {
                    this.contentNeedsCollapsing &&
                   <ShowMoreLessSection contentCollapsed={this.state.showingCollapsedContent}
                                        onClickMore={this.showMore}
                                        onClickLess={this.showLess}
                   />
                }
            </div>
                )
    }
}
// import SlideOne from './SlideOne';
// import SlideTwo from './SlideTwo';
// import SlideThree from './SlideThree';
// import RightArrow from './RightArrow';
// import LeftArrow from './LeftArrow';


class Slider extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      slideCount: 1
    }

    this.nextSlide = this.nextSlide.bind(this)
    this.previousSlide = this.previousSlide.bind(this)
  }

  nextSlide() {
      this.setState({ slideCount: this.state.slideCount + 1 })
    if (this.state.slideCount === 0) {
      this.setState({
        slideCount: this.state.slideCount - 3
      })
    }
  }

  previousSlide() {
      this.setState({ slideCount: this.state.slideCount - 1 })

  }

  render() {
    return (
      <div className="slider">
        { this.state.slideCount === 0 ? <Slide1 /> : null }
        { this.state.slideCount === 1 ? <SlideOne /> : null }
        { this.state.slideCount === 2 ? <SlideTwo /> : null }
        { this.state.slideCount === 3 ? <SlideThree /> : null }

        <RightArrow nextSlide={this.nextSlide} />
        <LeftArrow previousSlide={this.previousSlide} />
      </div>
    );
  }
}

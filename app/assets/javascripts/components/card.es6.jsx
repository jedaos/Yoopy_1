class Card extends React.Component{
  constructor(props){
    super(props);
    this.state = {
      backgroundColor: ''
    }
    this.handleEnter = this.handleEnter.bind(this)
    this.handleLeave = this.handleLeave.bind(this)
  }
  handleEnter(){
      this.setState({
        backgroundColor: "rgb(81, 79, 79)"
        })
      }
  handleLeave(){
    this.setState({
      backgroundColor: 'grey'
    })
  }

  render(){
    var cardStyle = {
      backgroundColor: this.state.backgroundColor
    }
    return(
      <div className="row">
        <div className="col s12 m7" style={cardStyle}>
          <div className="card" onMouseEnter={this.handleEnter} onMouseLeave={this.handleLeave}>
            <div className="card-image">
              <img src="https://images.pexels.com/photos/127873/pexels-photo-127873.jpeg?h=350&dpr=2&auto=compress&cs=tinysrgb" />
            </div>
            </div>
          </div>
        </div>
    )
  }
}

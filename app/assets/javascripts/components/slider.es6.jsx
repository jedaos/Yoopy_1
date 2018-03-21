
class Homepage extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      message: true
    }
    this.handleClick = this.handleClick.bind(this)
  }
  handleClick(){
    this.setState({
      message: !this.state.message
    })
  }
  render(){
    return(
      <div className="container" onClick={this.handleClick}>
        <h1>{this.state.message ? "Hello" : "Welcome to Yoopy"}</h1>
        <Card onMouseEnter={this.props.onMouseEnter}/>
      </div>
    )
  }

}

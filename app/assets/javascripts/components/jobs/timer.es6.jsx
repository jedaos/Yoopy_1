
class Timer extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      start: new Date(this.props.job).getTime(),
      end: (new Date(this.props.job).getTime()+(10800*1000)),
      time: 0
    }
    this.now = this.now.bind(this)
    this.stop = this.stop.bind(this)
  }

  now(){
    return this.state.end - new Date().getTime()
  }


  msToTime(s){
    var ms = s % 1000;
    s = (s - ms) / 1000;
    var secs = s % 60;
    s = (s - secs) / 60;
    var mins = s % 60;
    var hrs = (s - mins) / 60;
    this.setState({
    time: hrs + ':' + mins + ':' + secs
    })
}
  componentDidMount(){
    var self = this
  setInterval(function() {
    var x = self.now();
    return self.msToTime(x)
  }, 1000);
}
  stop(){
    const { time } = this.state;
    if (time === "00:00:00") {
      clearInterval();
    }
  }
  render () {
    let style = {};
    if (this.state.time === 0) {
      style.display = 'none'
    }
    return(
      <div style={style}>
        {this.state.time = "00:00:00" ? this.stop() : this.state.time}
      </div>
    );
  }
}

Timer.propTypes = {
  job: PropTypes.string
};
